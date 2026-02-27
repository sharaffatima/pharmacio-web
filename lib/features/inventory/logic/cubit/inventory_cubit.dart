import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/widgets/inventory_table_widget.dart';

part '../states/inventory_state.dart';
part 'inventory_cubit.freezed.dart';

class InventoryCubit extends Cubit<InventoryState> {
  InventoryCubit() : super(const InventoryState.initial());

  List<InventoryItem> _allItems = [];
  String searchQuery = '';
  bool lowStockOnly = false;

  void loadData() {
    emit(const InventoryState.loading());
    _allItems = InventoryItem.sampleData();
    _emitFiltered();
  }

  void updateSearch(String query) {
    searchQuery = query;
    _emitFiltered();
  }

  void toggleLowStock() {
    lowStockOnly = !lowStockOnly;
    _emitFiltered();
  }

  int get lowStockCount => _allItems.where((i) => i.isLowStock).length;
  int get totalStockValue =>
      _allItems.fold(0, (sum, i) => sum + i.currentStock);
  int get totalCount => _allItems.length;

  void _emitFiltered() {
    var filtered = List<InventoryItem>.from(_allItems);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (i) =>
                i.product.toLowerCase().contains(searchQuery.toLowerCase()) ||
                i.code.toLowerCase().contains(searchQuery.toLowerCase()),
          )
          .toList();
    }

    if (lowStockOnly) {
      filtered = filtered.where((i) => i.isLowStock).toList();
    }

    emit(InventoryState.success(filtered));
  }
}
