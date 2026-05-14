import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/inventory_api_item.dart';
import '../../data/models/inventory_create_request_body.dart';
import '../../logic/cubit/inventory_cubit.dart';
import '../widgets/inventory_header_widget.dart';
import '../widgets/inventory_table_widget.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 5,
      title: AppStrings.inventory,
      body: BlocConsumer<InventoryCubit, InventoryState>(
        listener: (context, state) {
          state.whenOrNull(
            successCreateInventoryItem: (createdItem, items) {
              showAppSnackBar(context, AppStrings.inventoryItemCreatedSuccess);
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
            successGetInventoryList: (items) => _buildContent(context, items),
            successCreateInventoryItem: (createdItem, items) =>
                _buildContent(context, items),
            successAdjustInventoryItem: (adjustResponse, items) =>
                _buildContent(context, items),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<InventoryApiItem> items) {
    final cubit = context.read<InventoryCubit>();
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 32.w,
        vertical: isMobile ? 20.h : 28.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const InventoryHeaderWidget(),
                verticalSpace(12),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: [
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
              ],
            )
          else
            Row(
              children: [
                const Expanded(child: InventoryHeaderWidget()),

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

          if (isMobile) ...[
            _buildSearchField(cubit),
            verticalSpace(12),
            _buildLowStockButton(cubit),
          ] else
            Row(
              children: [
                Expanded(child: _buildSearchField(cubit)),
                horizontalSpace(12),
                _buildLowStockButton(cubit),
              ],
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

  Widget _buildSearchField(InventoryCubit cubit) {
    if (_searchController.text != cubit.searchQuery) {
      _searchController.value = TextEditingValue(
        text: cubit.searchQuery,
        selection: TextSelection.collapsed(offset: cubit.searchQuery.length),
      );
    }
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        controller: _searchController,
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
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
        ),
      ),
    );
  }

  Widget _buildLowStockButton(InventoryCubit cubit) {
    return OutlinedButton.icon(
      onPressed: cubit.toggleLowStock,
      icon: Icon(
        Icons.warning_amber,
        size: 16.sp,
        color: cubit.lowStockOnly ? AppColors.brightRed : AppColors.coolGrey,
      ),
      label: Text(
        AppStrings.lowStockOnly,
        style: AppTextStyles.font14BlackRegular,
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: cubit.lowStockOnly ? AppColors.brightRed : AppColors.gainsboro,
        ),
        backgroundColor: cubit.lowStockOnly
            ? AppColors.brightRed.withValues(alpha: 0.05)
            : AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      ),
    );
  }

  Future<void> _showCreateDialog(BuildContext context) async {
    final cubit = context.read<InventoryCubit>();
    await showDialog(
      context: context,
      barrierColor: AppColors.blackOverlay45,
      builder: (dialogContext) => _InventoryCreateDialog(cubit: cubit),
    );
  }

  Future<void> _showAdjustDialog(
    BuildContext context,
    InventoryApiItem item,
  ) async {
    if (item.id == null) {
      showAppSnackBar(context, AppStrings.cannotAdjustItemMissingId);
      return;
    }

    final cubit = context.read<InventoryCubit>();
    await showDialog(
      context: context,
      builder: (dialogContext) =>
          _InventoryAdjustDialog(item: item, cubit: cubit),
    );
  }
}

class _InventoryCreateDialog extends StatefulWidget {
  const _InventoryCreateDialog({required this.cubit});

  final InventoryCubit cubit;

  @override
  State<_InventoryCreateDialog> createState() => _InventoryCreateDialogState();
}

class _InventoryCreateDialogState extends State<_InventoryCreateDialog> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _strengthController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _thresholdController = TextEditingController();
  var _isCreating = false;

  @override
  void dispose() {
    _productNameController.dispose();
    _strengthController.dispose();
    _quantityController.dispose();
    _thresholdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => Navigator.of(context).pop(),
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
              controller: _productNameController,
              label: AppStrings.productName,
            ),
            verticalSpace(12),
            _buildInventoryDialogField(
              controller: _strengthController,
              label: AppStrings.strength,
            ),
            verticalSpace(12),
            Row(
              children: [
                Expanded(
                  child: _buildInventoryDialogField(
                    controller: _quantityController,
                    label: AppStrings.quantityOnHand,
                    keyboardType: TextInputType.number,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: _buildInventoryDialogField(
                    controller: _thresholdController,
                    label: AppStrings.minThreshold,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            verticalSpace(20),
            if (_isCreating)
              const Center(child: LoadingWidget())
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
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
                    onPressed: _handleCreate,
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
  }

  Future<void> _handleCreate() async {
    setState(() => _isCreating = true);

    try {
      final quantity = int.tryParse(_quantityController.text.trim());
      final minThreshold = int.tryParse(_thresholdController.text.trim());

      if (_productNameController.text.trim().isEmpty ||
          _strengthController.text.trim().isEmpty ||
          quantity == null ||
          minThreshold == null) {
        showAppSnackBar(context, AppStrings.validValuesForAllFields);
        return;
      }

      await widget.cubit.createInventoryItem(
        InventoryCreateRequestBody(
          productName: _productNameController.text.trim(),
          strength: _strengthController.text.trim(),
          quantityOnHand: quantity,
          minThreshold: minThreshold,
        ),
      );

      if (!mounted) return;
      Navigator.of(context).pop();
    } finally {
      if (mounted) {
        setState(() => _isCreating = false);
      }
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
}

class _InventoryAdjustDialog extends StatefulWidget {
  const _InventoryAdjustDialog({required this.item, required this.cubit});

  final InventoryApiItem item;
  final InventoryCubit cubit;

  @override
  State<_InventoryAdjustDialog> createState() => _InventoryAdjustDialogState();
}

class _InventoryAdjustDialogState extends State<_InventoryAdjustDialog> {
  final TextEditingController _adjustmentController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  var _isAdjusting = false;

  @override
  void dispose() {
    _adjustmentController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    Icons.tune,
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
                        AppStrings.adjustQuantityTitle(
                          widget.item.product ?? '-',
                        ),
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
                  onTap: () => Navigator.of(context).pop(),
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
              controller: _adjustmentController,
              label: AppStrings.adjustmentHint,
              keyboardType: TextInputType.number,
            ),
            verticalSpace(12),
            _buildInventoryDialogField(
              controller: _reasonController,
              label: AppStrings.reason,
            ),
            verticalSpace(20),
            if (_isAdjusting)
              const Center(child: LoadingWidget())
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
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
                    onPressed: _handleAdjust,
                    icon: Icon(Icons.check, size: 16.sp),
                    label: Text(AppStrings.apply),
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
  }

  Future<void> _handleAdjust() async {
    setState(() => _isAdjusting = true);
    final adjustment = int.tryParse(_adjustmentController.text.trim());

    if (adjustment == null || _reasonController.text.trim().isEmpty) {
      showAppSnackBar(context, AppStrings.validAdjustmentAndReason);
      setState(() => _isAdjusting = false);
      return;
    }
    try {
      await widget.cubit.adjustInventoryItem(
        item: widget.item,
        adjustment: adjustment,
        reason: _reasonController.text.trim(),
      );

      if (!mounted) return;
      Navigator.of(context).pop();
    } finally {
      if (mounted) {
        setState(() => _isAdjusting = false);
      }
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
}
