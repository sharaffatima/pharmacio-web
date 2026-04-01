import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/inventory_item_response.dart';

class InventoryTableWidget extends StatelessWidget {
  final List<InventoryItemResponse> entries;
  final void Function(InventoryItemResponse item, int delta, String reason)
  onAdjust;
  final void Function(InventoryItemResponse item, int qty, double unitPrice)
  onRecordSale;

  const InventoryTableWidget({
    super.key,
    required this.entries,
    required this.onAdjust,
    required this.onRecordSale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.inventoryItems} (${entries.length})',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          _buildHeaderRow(),
          Divider(color: AppColors.gainsboro, height: 1),
          ...entries.map((item) => _buildDataRow(context, item)),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(AppStrings.product, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text('Strength', style: AppTextStyles.font13GreyRegular),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              AppStrings.currentStock,
              style: AppTextStyles.font13GreyRegular,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(AppStrings.status, style: AppTextStyles.font13GreyRegular),
          ),
          SizedBox(
            width: 100.w,
            child: Text(AppStrings.actions, style: AppTextStyles.font13GreyRegular),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(BuildContext context, InventoryItemResponse item) {
    final isLow = item.isLowStock;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Product + warning icon
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (isLow) ...[
                  Icon(Icons.warning_amber, size: 16.sp, color: AppColors.brightRed),
                  horizontalSpace(6),
                ],
                Flexible(
                  child: Text(
                    item.product,
                    style: AppTextStyles.font13BlackMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // Strength
          Expanded(
            flex: 1,
            child: Text(item.strength, style: AppTextStyles.font13GreyRegular),
          ),

          // Quantity
          SizedBox(
            width: 80.w,
            child: Text(
              '${item.quantity}',
              style: AppTextStyles.font13BlackMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Status badge
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isLow
                      ? AppColors.brightRed.withValues(alpha: 0.1)
                      : AppColors.emerald.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  isLow ? AppStrings.lowStock : AppStrings.normal,
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: isLow ? AppColors.brightRed : AppColors.emerald,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // Actions: Adjust + Sale
          SizedBox(
            width: 100.w,
            child: Row(
              children: [
                InkWell(
                  onTap: () => _showAdjustDialog(context, item),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Icon(
                      Icons.tune,
                      size: 20.sp,
                      color: AppColors.skyBlue,
                    ),
                  ),
                ),
                horizontalSpace(8),
                InkWell(
                  onTap: () => _showSaleDialog(context, item),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Icon(
                      Icons.point_of_sale_outlined,
                      size: 20.sp,
                      color: AppColors.emerald,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Adjust Dialog ───────────────────────────────────────────────────────
  void _showAdjustDialog(BuildContext context, InventoryItemResponse item) {
    final deltaController = TextEditingController();
    final reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: Text(
          'Adjust Stock — ${item.product}',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current stock: ${item.quantity}',
              style: AppTextStyles.font13GreyRegular,
            ),
            verticalSpace(12),
            TextField(
              controller: deltaController,
              keyboardType: const TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                labelText: 'Adjustment (e.g. +10 or -5)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            verticalSpace(12),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: 'Reason (optional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: AppTextStyles.font14CoolGreyRegular),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.skyBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              final delta = int.tryParse(deltaController.text.trim());
              if (delta == null) return;
              Navigator.of(context).pop();
              onAdjust(item, delta, reasonController.text.trim());
            },
            child: Text(
              'Apply',
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Sale Dialog ─────────────────────────────────────────────────────────
  void _showSaleDialog(BuildContext context, InventoryItemResponse item) {
    final qtyController = TextEditingController();
    final priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: Text(
          'Record Sale — ${item.product}',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available: ${item.quantity}',
              style: AppTextStyles.font13GreyRegular,
            ),
            verticalSpace(12),
            TextField(
              controller: qtyController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity Sold',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            verticalSpace(12),
            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Unit Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: AppTextStyles.font14CoolGreyRegular),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emerald,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            onPressed: () {
              final qty = int.tryParse(qtyController.text.trim());
              final price = double.tryParse(priceController.text.trim());
              if (qty == null || price == null) return;
              Navigator.of(context).pop();
              onRecordSale(item, qty, price);
            },
            child: Text(
              'Record',
              style: AppTextStyles.font14BlackRegular.copyWith(
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
