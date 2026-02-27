part of '../cubit/inventory_cubit.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = InventoryInitial;
  const factory InventoryState.loading() = InventoryLoading;
  const factory InventoryState.success(List<InventoryItem> items) =
      InventorySuccess;
  const factory InventoryState.error({required String error}) = InventoryError;
}
