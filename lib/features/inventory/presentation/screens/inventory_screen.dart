import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../data/models/inventory_api_item.dart';
import '../../data/models/inventory_create_request_body.dart';
import '../../logic/cubit/inventory_cubit.dart';
import '../widgets/inventory_header_widget.dart';
import '../widgets/inventory_stat_cards_widget.dart';
import '../widgets/inventory_table_widget.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 5),
          Expanded(
            child: BlocConsumer<InventoryCubit, InventoryState>(
              listener: (context, state) {
                state.whenOrNull(
                  successCreateInventoryItem: (createdItem, items) {
                    showAppSnackBar(
                      context,
                      AppStrings.inventoryItemCreatedSuccess,
                    );
                  },
                  successAdjustInventoryItem: (adjustResponse, items) {
                    showAppSnackBar(
                      context,
                      AppStrings.inventoryQuantityAdjustedSuccess,
                    );
                  },
                  error: (error) => showAppSnackBar(context, error),
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => RetryButtonWidget(
                    message: error,
                    onRetry: () => context.read<InventoryCubit>().loadData(),
                  ),
                  successGetInventoryList: (items) =>
                      _buildContent(context, items),
                  successCreateInventoryItem: (createdItem, items) =>
                      _buildContent(context, items),
                  successAdjustInventoryItem: (adjustResponse, items) =>
                      _buildContent(context, items),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<InventoryApiItem> items) {
    final cubit = context.read<InventoryCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: InventoryHeaderWidget()),
              OutlinedButton.icon(
                onPressed: () => _showRecordSaleDialog(context, items),
                icon: Icon(Icons.point_of_sale_outlined, size: 18.sp),
                label: Text(AppStrings.recordSale),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.gainsboro),
                  foregroundColor: AppColors.charcoalBlack,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              horizontalSpace(10),
              ElevatedButton.icon(
                onPressed: () => _showCreateDialog(context),
                icon: Icon(Icons.add, size: 18.sp),
                label: Text(AppStrings.addItem),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.charcoalBlack,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(24),

          InventoryStatCardsWidget(
            totalItems: cubit.totalCount,
            lowStockItems: cubit.lowStockCount,
            totalStockValue: cubit.totalStockValue,
          ),
          verticalSpace(24),

          // ─── Search & Filter ──────────────────
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.gainsboro, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.searchAndFilter,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.offWhiteGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextField(
                          controller:
                              TextEditingController(text: cubit.searchQuery)
                                ..selection = TextSelection.collapsed(
                                  offset: cubit.searchQuery.length,
                                ),
                          onChanged: cubit.updateSearch,
                          style: AppTextStyles.font14BlackRegular,
                          decoration: InputDecoration(
                            hintText: AppStrings.searchByProduct,
                            hintStyle: AppTextStyles.font13GreyRegular,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.sp,
                              color: AppColors.coolGrey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    OutlinedButton.icon(
                      onPressed: cubit.toggleLowStock,
                      icon: Icon(
                        Icons.warning_amber,
                        size: 16.sp,
                        color: cubit.lowStockOnly
                            ? AppColors.brightRed
                            : AppColors.coolGrey,
                      ),
                      label: Text(
                        AppStrings.lowStockOnly,
                        style: AppTextStyles.font14BlackRegular,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: cubit.lowStockOnly
                              ? AppColors.brightRed
                              : AppColors.gainsboro,
                        ),
                        backgroundColor: cubit.lowStockOnly
                            ? AppColors.brightRed.withValues(alpha: 0.05)
                            : AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(24),

          InventoryTableWidget(
            entries: items,
            onEdit: (item) => _showAdjustDialog(context, item),
          ),
        ],
      ),
    );
  }

  Future<void> _showCreateDialog(BuildContext context) async {
    final productNameController = TextEditingController();
    final strengthController = TextEditingController();
    final quantityController = TextEditingController();
    final thresholdController = TextEditingController();
    var isCreating = false;

    try {
      await showDialog(
        context: context,
        barrierColor: AppColors.blackOverlay45,
        builder: (dialogContext) {
          return StatefulBuilder(
            builder: (dialogContext, setState) {
              return Dialog(
                backgroundColor: AppColors.transparent,
                insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  width: 520.w,
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.gainsboro, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackOverlay08,
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              color: AppColors.skyBlue.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.inventory_2_outlined,
                              size: 18.sp,
                              color: AppColors.skyBlue,
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.createInventoryItem,
                                  style: AppTextStyles.font16BlackSemiBold,
                                ),
                                verticalSpace(2),
                                Text(
                                  AppStrings.enterInventoryDetails,
                                  style: AppTextStyles.font12GreyRegular,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.of(dialogContext).pop(),
                            borderRadius: BorderRadius.circular(8.r),
                            child: Padding(
                              padding: EdgeInsets.all(4.r),
                              child: Icon(
                                Icons.close,
                                size: 18.sp,
                                color: AppColors.coolGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(18),
                      _buildInventoryDialogField(
                        controller: productNameController,
                        label: AppStrings.productName,
                      ),
                      verticalSpace(12),
                      _buildInventoryDialogField(
                        controller: strengthController,
                        label: AppStrings.strength,
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildInventoryDialogField(
                              controller: quantityController,
                              label: AppStrings.quantityOnHand,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: _buildInventoryDialogField(
                              controller: thresholdController,
                              label: AppStrings.minThreshold,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      if (isCreating)
                        const Center(child: LoadingWidget())
                      else
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              onPressed: () =>
                                  Navigator.of(dialogContext).pop(),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: AppColors.gainsboro),
                                foregroundColor: AppColors.coolGrey,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.w,
                                  vertical: 11.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              child: Text(
                                AppStrings.cancel,
                                style: AppTextStyles.font14BlackRegular
                                    .copyWith(color: AppColors.coolGrey),
                              ),
                            ),
                            horizontalSpace(10),
                            ElevatedButton.icon(
                              onPressed: () async {
                                setState(() => isCreating = true);

                                try {
                                  final quantity = int.tryParse(
                                    quantityController.text.trim(),
                                  );
                                  final minThreshold = int.tryParse(
                                    thresholdController.text.trim(),
                                  );

                                  if (productNameController.text
                                          .trim()
                                          .isEmpty ||
                                      strengthController.text.trim().isEmpty ||
                                      quantity == null ||
                                      minThreshold == null) {
                                    showAppSnackBar(
                                      context,
                                      AppStrings.validValuesForAllFields,
                                    );
                                    return;
                                  }

                                  await context
                                      .read<InventoryCubit>()
                                      .createInventoryItem(
                                        InventoryCreateRequestBody(
                                          productName: productNameController
                                              .text
                                              .trim(),
                                          strength: strengthController.text
                                              .trim(),
                                          quantityOnHand: quantity,
                                          minThreshold: minThreshold,
                                        ),
                                      );

                                  if (dialogContext.mounted) {
                                    Navigator.of(dialogContext).pop();
                                  }
                                } finally {
                                  if (dialogContext.mounted) {
                                    setState(() => isCreating = false);
                                  }
                                }
                              },
                              icon: Icon(Icons.check, size: 16.sp),
                              label: Text(AppStrings.save),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.charcoalBlack,
                                foregroundColor: AppColors.white,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.w,
                                  vertical: 11.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    } finally {
      productNameController.dispose();
      strengthController.dispose();
      quantityController.dispose();
      thresholdController.dispose();
    }
  }

  Widget _buildInventoryDialogField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font13GreyRegular),
        verticalSpace(6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: AppTextStyles.font14BlackRegular,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.offWhiteGrey,
            hintText: label,
            hintStyle: AppTextStyles.font12GreyRegular,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 11.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.gainsboro),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.gainsboro),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.skyBlue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showRecordSaleDialog(
    BuildContext context,
    List<InventoryApiItem> items,
  ) async {
    final availableItems = List<InventoryApiItem>.from(items);
    if (availableItems.isEmpty) {
      showAppSnackBar(context, AppStrings.noInventoryItemsToSell);
      return;
    }

    final selectedInventoryId = ValueNotifier<int?>(1);
    final quantitySoldController = TextEditingController();
    final unitPriceController = TextEditingController();
    final soldAtController = TextEditingController(
      text: DateTime.now().toUtc().toIso8601String(),
    );

    try {
      await showDialog(
        context: context,
        barrierColor: AppColors.blackOverlay45,
        builder: (dialogContext) {
          return Dialog(
            backgroundColor: AppColors.transparent,
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Container(
              width: 520.w,
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(14.r),
                border: Border.all(color: AppColors.gainsboro, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackOverlay08,
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.saffronAmber.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.point_of_sale_outlined,
                          size: 18.sp,
                          color: AppColors.saffronAmber,
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.recordInventorySale,
                              style: AppTextStyles.font16BlackSemiBold,
                            ),
                            verticalSpace(2),
                            Text(
                              AppStrings.enterSaleDetails,
                              style: AppTextStyles.font12GreyRegular,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(dialogContext).pop(),
                        borderRadius: BorderRadius.circular(8.r),
                        child: Padding(
                          padding: EdgeInsets.all(4.r),
                          child: Icon(
                            Icons.close,
                            size: 18.sp,
                            color: AppColors.coolGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(18),
                  Text(
                    AppStrings.inventoryItem,
                    style: AppTextStyles.font13GreyRegular,
                  ),
                  verticalSpace(6),
                  ValueListenableBuilder<int?>(
                    valueListenable: selectedInventoryId,
                    builder: (context, selectedId, _) {
                      return DropdownButtonFormField<int>(
                        initialValue: selectedId,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.offWhiteGrey,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 11.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: AppColors.gainsboro),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: AppColors.gainsboro),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppColors.skyBlue,
                              width: 1.5,
                            ),
                          ),
                        ),
                        dropdownColor: AppColors.white,
                        style: AppTextStyles.font14BlackRegular,
                        items: availableItems.asMap().entries.map((entry) {
                          final inventoryId = entry.key + 1;
                          final item = entry.value;
                          return DropdownMenuItem<int>(
                            value: inventoryId,
                            child: Text(
                              AppStrings.inventorySaleOptionLabel(
                                product: item.product ?? AppStrings.unknown,
                                inventoryId: inventoryId,
                                quantity: item.quantity ?? 0,
                              ),
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          selectedInventoryId.value = value;
                        },
                      );
                    },
                  ),
                  verticalSpace(12),
                  _buildInventoryDialogField(
                    controller: quantitySoldController,
                    label: AppStrings.quantitySold,
                    keyboardType: TextInputType.number,
                  ),
                  verticalSpace(12),
                  _buildInventoryDialogField(
                    controller: unitPriceController,
                    label: AppStrings.unitPrice,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                  verticalSpace(12),
                  _buildInventoryDialogField(
                    controller: soldAtController,
                    label: AppStrings.soldAt,
                  ),
                  verticalSpace(4),
                  Text(
                    AppStrings.soldAtIsoHint,
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.gainsboro),
                          foregroundColor: AppColors.coolGrey,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 11.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          AppStrings.cancel,
                          style: AppTextStyles.font14BlackRegular.copyWith(
                            color: AppColors.coolGrey,
                          ),
                        ),
                      ),
                      horizontalSpace(10),
                      ElevatedButton.icon(
                        onPressed: () async {
                          final quantitySold = int.tryParse(
                            quantitySoldController.text.trim(),
                          );
                          final inventoryId = selectedInventoryId.value;
                          final unitPrice = unitPriceController.text.trim();
                          final unitPriceValue = double.tryParse(unitPrice);
                          final soldAt = DateTime.tryParse(
                            soldAtController.text.trim(),
                          );

                          if (inventoryId == null ||
                              quantitySold == null ||
                              quantitySold <= 0 ||
                              unitPriceValue == null ||
                              unitPriceValue <= 0 ||
                              soldAt == null) {
                            showAppSnackBar(
                              context,
                              AppStrings.validSaleValues,
                            );
                            return;
                          }

                          final response = await context
                              .read<InventoryCubit>()
                              .recordSale(
                                inventoryId: inventoryId,
                                quantitySold: quantitySold,
                                unitPrice: unitPrice,
                                soldAt: soldAt,
                              );

                          if (response == null) {
                            return;
                          }

                          if (dialogContext.mounted) {
                            Navigator.of(dialogContext).pop();
                          }

                          if (!context.mounted) {
                            return;
                          }

                          showAppSnackBar(
                            context,
                            AppStrings.saleRecordedSuccess(
                              response.remainingQuantity ?? 0,
                            ),
                          );
                        },
                        icon: Icon(Icons.check, size: 16.sp),
                        label: Text(AppStrings.recordSale),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.charcoalBlack,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 11.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    } finally {
      selectedInventoryId.dispose();
      quantitySoldController.dispose();
      unitPriceController.dispose();
      soldAtController.dispose();
    }
  }

  Future<void> _showAdjustDialog(
    BuildContext context,
    InventoryApiItem item,
  ) async {
    if (item.id == null) {
      showAppSnackBar(context, AppStrings.cannotAdjustItemMissingId);
      return;
    }

    final adjustmentController = TextEditingController();
    final reasonController = TextEditingController();

    await showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(AppStrings.adjustQuantityTitle(item.product ?? '-')),
          content: SizedBox(
            width: 420.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: adjustmentController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: AppStrings.adjustmentHint,
                  ),
                ),
                TextField(
                  controller: reasonController,
                  decoration: InputDecoration(labelText: AppStrings.reason),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(AppStrings.cancel),
            ),
            ElevatedButton(
              onPressed: () async {
                final adjustment = int.tryParse(
                  adjustmentController.text.trim(),
                );

                if (adjustment == null ||
                    reasonController.text.trim().isEmpty) {
                  showAppSnackBar(context, AppStrings.validAdjustmentAndReason);
                  return;
                }

                await context.read<InventoryCubit>().adjustInventoryItem(
                  item: item,
                  adjustment: adjustment,
                  reason: reasonController.text.trim(),
                );

                if (dialogContext.mounted) {
                  Navigator.of(dialogContext).pop();
                }
              },
              child: Text(AppStrings.apply),
            ),
          ],
        );
      },
    );
  }
}
