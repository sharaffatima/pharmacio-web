import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/offer_model.dart';
import '../../data/repos/offers_repo.dart';

part '../states/offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepo _offersRepo;

  OffersCubit(this._offersRepo) : super(const OffersState.initial());

  List<OfferModel> _allOffers = [];
  String searchQuery = '';
  String selectedSupplier = 'All Suppliers';
  String selectedWarehouse = 'All Warehouses';
  int? sortColumnIndex;
  bool sortAscending = true;

  Future<void> loadData() async {
    emit(const OffersState.loading());
    try {
      _allOffers = await _offersRepo.getOffers();
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
    var filtered = List<OfferModel>.from(_allOffers);

    if (searchQuery.isNotEmpty) {
      final query = searchQuery.toLowerCase();
      filtered = filtered
          .where(
            (o) =>
                o.name.toLowerCase().contains(query) ||
                o.supplier.toLowerCase().contains(query),
          )
          .toList();
    }

    if (selectedSupplier != 'All Suppliers') {
      filtered = filtered.where((o) => o.supplier == selectedSupplier).toList();
    }

    if (selectedWarehouse != 'All Warehouses') {
      filtered = filtered
          .where((o) => o.warehouse == selectedWarehouse)
          .toList();
    }

    if (sortColumnIndex != null) {
      filtered.sort((a, b) {
        int result;
        switch (sortColumnIndex) {
          case 0:
            result = a.name.compareTo(b.name);
            break;
          case 1:
            result = a.supplier.compareTo(b.supplier);
            break;
          case 2:
            result = a.warehouse.compareTo(b.warehouse);
            break;
          case 3:
            result = a.uploadDate.compareTo(b.uploadDate);
            break;
          default:
            result = 0;
        }
        return sortAscending ? result : -result;
      });
    }

    emit(OffersState.success(filtered));
  }
}
