part of '../cubit/inventory_cubit.dart';

@freezed
class InventoryState with _$InventoryState {
  const factory InventoryState.initial() = InventoryInitial;
  const factory InventoryState.loading() = InventoryLoading;
  const factory InventoryState.success(List<InventoryItemResponse> items) =
      InventorySuccess;
  const factory InventoryState.createSuccess(
    InventoryItemResponse item,
  ) = InventoryCreateSuccess;
  const factory InventoryState.adjustSuccess(
    InventoryAdjustResponse response,
  ) = InventoryAdjustSuccess;
  const factory InventoryState.saleSuccess(SaleResponse response) =
      InventorySaleSuccess;
  const factory InventoryState.error({required String error}) = InventoryError;
}
