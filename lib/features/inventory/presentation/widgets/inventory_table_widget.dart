import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/inventory_api_item.dart';

class InventoryTableWidget extends StatelessWidget {
  final List<InventoryApiItem> entries;
  final ValueChanged<InventoryApiItem> onEdit;

  const InventoryTableWidget({
    super.key,
    required this.entries,
    required this.onEdit,
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
          ...entries.asMap().entries.map((e) => _buildDataRow(e.value, e.key)),
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
            child: Text(
              AppStrings.product,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.currentStock,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.status,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text(
              AppStrings.actions,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(InventoryApiItem item, int index) {
    final isLow = (item.status ?? '').toLowerCase() == 'low';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // Product with warning icon
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (isLow) ...[
                  Icon(
                    Icons.warning_amber,
                    size: 16.sp,
                    color: AppColors.brightRed,
                  ),
                  horizontalSpace(6),
                ],
                Flexible(
                  child: Text(
                    item.product ?? '-',
                    style: AppTextStyles.font13BlackMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${item.quantity ?? 0}',
              style: AppTextStyles.font13BlackMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Status
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

          SizedBox(
            width: 50.w,
            child: InkWell(
              onTap: () => onEdit(item),
              borderRadius: BorderRadius.circular(4.r),
              child: Icon(
                Icons.edit_outlined,
                size: 20.sp,
                color: AppColors.coolGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
