import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/inventory_adjust_request_body.dart';
import '../../data/models/inventory_adjust_response.dart';
import '../../data/models/inventory_api_item.dart';
import '../../data/models/inventory_create_request_body.dart';
import '../../data/models/inventory_sale_request_body.dart';
import '../../data/models/inventory_sale_response.dart';
import '../../data/repos/inventory_repo.dart';

part '../states/inventory_state.dart';
part 'inventory_cubit.freezed.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;

  InventoryCubit(this._inventoryRepo) : super(const InventoryState.initial());

  List<InventoryApiItem> _allItems = [];
  String searchQuery = '';
  bool lowStockOnly = false;

  Future<void> loadData() async {
    emit(const InventoryState.loading());

    try {
      await _refreshInventoryList();
      _emitFiltered();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  Future<void> createInventoryItem(
    InventoryCreateRequestBody requestBody,
  ) async {
    emit(const InventoryState.loading());

    try {
      final createdItem = await _inventoryRepo.createInventoryItem(requestBody);
      await _refreshInventoryList();
      _emitFiltered(createdItem: createdItem);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  Future<void> adjustInventoryItem({
    required InventoryApiItem item,
    required int adjustment,
    required String reason,
  }) async {
    if (item.id == null) {
      emit(InventoryState.error(error: AppStrings.cannotAdjustItemMissingId));
      return;
    }

    emit(const InventoryState.loading());

    try {
      final adjustResponse = await _inventoryRepo.adjustInventoryItem(
        inventoryId: item.id!,
        requestBody: InventoryAdjustRequestBody(
          adjustment: adjustment,
          reason: reason,
        ),
      );
      await _refreshInventoryList();
      _emitFiltered(adjustResponse: adjustResponse);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  Future<InventorySaleResponse?> recordSale({
    required int inventoryId,
    required int quantitySold,
    required String unitPrice,
    required DateTime soldAt,
  }) async {
    emit(const InventoryState.loading());

    try {
      final saleResponse = await _inventoryRepo.recordSale(
        InventorySaleRequestBody(
          inventoryId: inventoryId,
          quantitySold: quantitySold,
          unitPrice: unitPrice,
          soldAt: soldAt.toUtc(),
        ),
      );

      await _refreshInventoryList();
      _emitFiltered();
      return saleResponse;
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
      return null;
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    _emitFiltered();
  }

  void toggleLowStock() {
    lowStockOnly = !lowStockOnly;
    _emitFiltered();
  }

  int get lowStockCount =>
      _allItems.where((i) => (i.status ?? '').toLowerCase() == 'low').length;
  int get totalStockValue =>
      _allItems.fold(0, (sum, i) => sum + (i.quantity ?? 0));
  int get totalCount => _allItems.length;

  Future<void> _refreshInventoryList() async {
    final response = await _inventoryRepo.getInventoryList();
    _allItems = response.results ?? [];
  }

  void _emitFiltered({
    InventoryApiItem? createdItem,
    InventoryAdjustResponse? adjustResponse,
  }) {
    var filtered = List<InventoryApiItem>.from(_allItems);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (i) => (i.product ?? '').toLowerCase().contains(
              searchQuery.toLowerCase(),
            ),
          )
          .toList();
    }

    if (lowStockOnly) {
      filtered = filtered
          .where((i) => (i.status ?? '').toLowerCase() == 'low')
          .toList();
    }

    if (createdItem != null) {
      emit(
        InventoryState.successCreateInventoryItem(
          createdItem: createdItem,
          items: filtered,
        ),
      );
      return;
    }

    if (adjustResponse != null) {
      emit(
        InventoryState.successAdjustInventoryItem(
          adjustResponse: adjustResponse,
          items: filtered,
        ),
      );
      return;
    }

    emit(InventoryState.successGetInventoryList(filtered));
  }
}
