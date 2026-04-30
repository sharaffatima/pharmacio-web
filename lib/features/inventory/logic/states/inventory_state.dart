part of '../cubit/inventory_cubit.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = InventoryInitial;
  const factory InventoryState.loading() = InventoryLoading;
  const factory InventoryState.successGetInventoryList(
    List<InventoryApiItem> items,
  ) = SuccessGetInventoryList;
  const factory InventoryState.successCreateInventoryItem({
    required InventoryApiItem createdItem,
    required List<InventoryApiItem> items,
  }) = SuccessCreateInventoryItem;
  const factory InventoryState.successAdjustInventoryItem({
    required InventoryAdjustResponse adjustResponse,
    required List<InventoryApiItem> items,
  }) = SuccessAdjustInventoryItem;
  const factory InventoryState.error({required String error}) = InventoryError;
}
