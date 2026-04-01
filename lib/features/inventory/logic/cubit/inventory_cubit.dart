import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/inventory_adjust_request_body.dart';
import '../../data/models/inventory_adjust_response.dart';
import '../../data/models/inventory_create_request_body.dart';
import '../../data/models/inventory_item_response.dart';
import '../../data/models/sale_create_request_body.dart';
import '../../data/models/sale_response.dart';
import '../../data/repos/inventory_repo.dart';

part '../states/inventory_state.dart';
part 'inventory_cubit.freezed.dart';

class InventoryCubit extends Cubit<InventoryState> {
  final InventoryRepo _inventoryRepo;

  InventoryCubit(this._inventoryRepo) : super(const InventoryState.initial());

  List<InventoryItemResponse> _allItems = [];
  String searchQuery = '';
  bool lowStockOnly = false;

  // ─── Computed ─────────────────────────────────────────────────────────────
  int get lowStockCount => _allItems.where((i) => i.isLowStock).length;
  int get totalStockValue =>
      _allItems.fold(0, (sum, i) => sum + i.quantity);
  int get totalCount => _allItems.length;

  // ─── Load ─────────────────────────────────────────────────────────────────
  Future<void> loadData() async {
    emit(const InventoryState.loading());
    try {
      _allItems = await _inventoryRepo.getInventory();
      _emitFiltered();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  // ─── Create ───────────────────────────────────────────────────────────────
  Future<void> createItem(InventoryCreateRequestBody body) async {
    emit(const InventoryState.loading());
    try {
      final item = await _inventoryRepo.createInventoryItem(body);
      _allItems.insert(0, item);
      emit(InventoryState.createSuccess(item));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  // ─── Adjust ───────────────────────────────────────────────────────────────
  Future<void> adjustItem(int id, int delta, {String reason = ''}) async {
    emit(const InventoryState.loading());
    try {
      final response = await _inventoryRepo.adjustInventory(
        id,
        InventoryAdjustRequestBody(adjustment: delta, reason: reason),
      );
      // Refresh list after successful adjustment
      _allItems = await _inventoryRepo.getInventory();
      emit(InventoryState.adjustSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  // ─── Record Sale ──────────────────────────────────────────────────────────
  Future<void> recordSale(SaleCreateRequestBody body) async {
    emit(const InventoryState.loading());
    try {
      final response = await _inventoryRepo.recordSale(body);
      // Refresh list to reflect updated stock
      _allItems = await _inventoryRepo.getInventory();
      emit(InventoryState.saleSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(InventoryState.error(error: message));
    }
  }

  // ─── Local Filters (client-side, no extra API call) ───────────────────────
  void updateSearch(String query) {
    searchQuery = query;
    _emitFiltered();
  }

  void toggleLowStock() {
    lowStockOnly = !lowStockOnly;
    _emitFiltered();
  }

  void _emitFiltered() {
    var filtered = List<InventoryItemResponse>.from(_allItems);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (i) =>
                i.product.toLowerCase().contains(searchQuery.toLowerCase()) ||
                i.strength.toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }

    if (lowStockOnly) {
      filtered = filtered.where((i) => i.isLowStock).toList();
    }

    emit(InventoryState.success(filtered));
  }
}
