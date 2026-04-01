import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class OffersFiltersWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedSupplier;
  final String selectedWarehouse;
  final List<String> suppliers;
  final List<String> warehouses;
  final ValueChanged<String> onSupplierChanged;
  final ValueChanged<String> onWarehouseChanged;
  final VoidCallback onClearFilters;

  const OffersFiltersWidget({
    super.key,
    required this.searchController,
    required this.selectedSupplier,
    required this.selectedWarehouse,
    required this.suppliers,
    required this.warehouses,
    required this.onSupplierChanged,
    required this.onWarehouseChanged,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.filter_list, size: 20.sp, color: AppColors.coolGrey),
              horizontalSpace(8),
              Text(
                AppStrings.filtersAndSearch,
                style: AppTextStyles.font16BlackSemiBold,
              ),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              // ─── Search ───────────────────────────
              Expanded(
                flex: 2,
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: AppColors.offWhiteGrey,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: TextField(
                    controller: searchController,
                    style: AppTextStyles.font14BlackRegular,
                    decoration: InputDecoration(
                      hintText: AppStrings.searchOffers,
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
                ),
              ),
              horizontalSpace(12),

              // ─── Supplier Dropdown ────────────────
              Expanded(
                flex: 1,
                child: _buildDropdown(
                  value: selectedSupplier,
                  items: suppliers,
                  onChanged: onSupplierChanged,
                ),
              ),
              horizontalSpace(12),

              // ─── Warehouse Dropdown ───────────────
              Expanded(
                flex: 1,
                child: _buildDropdown(
                  value: selectedWarehouse,
                  items: warehouses,
                  onChanged: onWarehouseChanged,
                ),
              ),
              horizontalSpace(12),

              // ─── Clear Filters ────────────────────
              OutlinedButton(
                onPressed: onClearFilters,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.gainsboro),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                ),
                child: Text(
                  AppStrings.clearFilters,
                  style: AppTextStyles.font14BlackRegular,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gainsboro),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 20.sp,
            color: AppColors.coolGrey,
          ),
          style: AppTextStyles.font14BlackRegular,
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}
