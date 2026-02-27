import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class InventoryItem {
  final String product;
  final String code;
  final String location;
  final int currentStock;
  final int minStock;
  final int maxStock;
  final String lastUpdated;

  const InventoryItem({
    required this.product,
    required this.code,
    required this.location,
    required this.currentStock,
    required this.minStock,
    required this.maxStock,
    required this.lastUpdated,
  });

  bool get isLowStock => currentStock <= minStock;

  static List<InventoryItem> sampleData() => [
    const InventoryItem(
      product: 'Laptop Dell XPS 15',
      code: 'DELL-XPS-15',
      location: 'Warehouse 1',
      currentStock: 45,
      minStock: 20,
      maxStock: 100,
      lastUpdated: '2026-02-11',
    ),
    const InventoryItem(
      product: 'Office Chair Pro',
      code: 'CHAIR-PRO-001',
      location: 'Warehouse 2',
      currentStock: 15,
      minStock: 25,
      maxStock: 80,
      lastUpdated: '2026-02-10',
    ),
    const InventoryItem(
      product: 'Monitor 27" 4K',
      code: 'MON-27-4K',
      location: 'Warehouse 1',
      currentStock: 8,
      minStock: 15,
      maxStock: 60,
      lastUpdated: '2026-02-10',
    ),
    const InventoryItem(
      product: 'Wireless Keyboard',
      code: 'KB-WIRELESS-01',
      location: 'Warehouse 3',
      currentStock: 120,
      minStock: 50,
      maxStock: 200,
      lastUpdated: '2026-02-09',
    ),
    const InventoryItem(
      product: 'USB-C Hub 7-Port',
      code: 'HUB-USBC-7P',
      location: 'Warehouse 2',
      currentStock: 35,
      minStock: 30,
      maxStock: 100,
      lastUpdated: '2026-02-08',
    ),
    const InventoryItem(
      product: 'Desk Lamp LED',
      code: 'LAMP-LED-001',
      location: 'Warehouse 1',
      currentStock: 5,
      minStock: 20,
      maxStock: 80,
      lastUpdated: '2026-02-08',
    ),
  ];
}

class InventoryTableWidget extends StatelessWidget {
  final List<InventoryItem> entries;
  final ValueChanged<int> onEdit;

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
          const Divider(color: AppColors.gainsboro, height: 1),
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
              AppStrings.code,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.location,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              AppStrings.currentStock,
              style: AppTextStyles.font13GreyRegular,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.minMax,
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
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.lastUpdated,
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

  Widget _buildDataRow(InventoryItem item, int index) {
    final isLow = item.isLowStock;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: const BoxDecoration(
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
                    item.product,
                    style: AppTextStyles.font13BlackMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(item.code, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text(item.location, style: AppTextStyles.font13GreyRegular),
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              '${item.currentStock}',
              style: AppTextStyles.font13BlackMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${item.minStock} / ${item.maxStock}',
              style: AppTextStyles.font13GreyRegular,
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

          Expanded(
            flex: 1,
            child: Text(
              item.lastUpdated,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),

          SizedBox(
            width: 50.w,
            child: InkWell(
              onTap: () => onEdit(index),
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
