import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/available_offer_item.dart';
import '../../data/repos/offers_repo.dart';

part '../states/offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepo _offersRepo;

  OffersCubit(this._offersRepo) : super(const OffersState.initial());

  List<AvailableOfferItem> _allOffers = [];
  String searchQuery = '';
  String selectedSupplier = 'All Suppliers'; // mapped to status value
  String selectedWarehouse = 'All Warehouses';
  int? sortColumnIndex;
  bool sortAscending = true;

  Future<void> loadData() async {
    emit(const OffersState.loading());

    try {
      final response = await _offersRepo.getAvailableOffers();
      _allOffers = response.results ?? [];
      _emitFiltered();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(OffersState.error(error: message));
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    _emitFiltered();
  }

  void updateSupplier(String supplier) {
    selectedSupplier = supplier;
    _emitFiltered();
  }

  void updateWarehouse(String warehouse) {
    selectedWarehouse = warehouse;
    _emitFiltered();
  }

  void sort(int colIndex) {
    if (sortColumnIndex == colIndex) {
      sortAscending = !sortAscending;
    } else {
      sortColumnIndex = colIndex;
      sortAscending = true;
    }
    _emitFiltered();
  }

  void clearFilters() {
    searchQuery = '';
    selectedSupplier = 'All Suppliers';
    selectedWarehouse = 'All Warehouses';
    sortColumnIndex = null;
    sortAscending = true;
    _emitFiltered();
  }

  void _emitFiltered() {
    var filtered = List<AvailableOfferItem>.from(_allOffers);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (o) =>
                (o.originalFilename ?? '').toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                (o.fileId ?? '').toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    if (selectedSupplier != 'All Suppliers') {
      filtered = filtered
          .where((o) => _statusLabel(o.status ?? '') == selectedSupplier)
          .toList();
    }

    if (selectedWarehouse != 'All Warehouses') {
      filtered = filtered
          .where((o) => _warehouseLabel(o.wareHouseName) == selectedWarehouse)
          .toList();
    }

    if (sortColumnIndex != null) {
      filtered.sort((a, b) {
        int result;
        switch (sortColumnIndex) {
          case 0:
            result = (a.originalFilename ?? '').compareTo(
              b.originalFilename ?? '',
            );
            break;
          case 1:
            result = _statusLabel(
              a.status ?? '',
            ).compareTo(_statusLabel(b.status ?? ''));
            break;
          case 2:
            result = _warehouseLabel(
              a.wareHouseName,
            ).compareTo(_warehouseLabel(b.wareHouseName));
            break;
          case 3:
            result = (a.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0))
                .compareTo(
                  b.createdAt ?? DateTime.fromMillisecondsSinceEpoch(0),
                );
            break;
          case 4:
            result = (a.itemsCount ?? 0).compareTo(b.itemsCount ?? 0);
            break;
          default:
            result = 0;
        }
        return sortAscending ? result : -result;
      });
    }

    emit(OffersState.successGetAvailableOffers(filtered));
  }

  String _statusLabel(String status) {
    if (status.toLowerCase() == 'completed') {
      return 'Completed';
    }
    return status;
  }

  String _warehouseLabel(String? warehouseName) {
    final value = warehouseName?.trim();
    if (value == null || value.isEmpty) {
      return 'Unassigned';
    }
    return value;
  }
}
