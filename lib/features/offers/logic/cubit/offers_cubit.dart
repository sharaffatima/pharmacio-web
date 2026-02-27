import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/widgets/offers_table_widget.dart';

part '../states/offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit() : super(const OffersState.initial());

  List<OfferEntry> _allOffers = [];
  String searchQuery = '';
  String selectedSupplier = 'All Suppliers';
  String selectedWarehouse = 'All Warehouses';
  int? sortColumnIndex;
  bool sortAscending = true;

  void loadData() {
    emit(const OffersState.loading());
    _allOffers = OfferEntry.sampleData();
    _emitFiltered();
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
    var filtered = List<OfferEntry>.from(_allOffers);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (o) => o.name.toLowerCase().contains(searchQuery.toLowerCase()),
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
