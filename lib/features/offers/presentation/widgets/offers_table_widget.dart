import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

/// Model for an offer entry.
class OfferEntry {
  final String name;
  final String supplier;
  final String warehouse;
  final String uploadDate;
  final int items;
  final String status;

  const OfferEntry({
    required this.name,
    required this.supplier,
    required this.warehouse,
    required this.uploadDate,
    required this.items,
    required this.status,
  });

  static List<OfferEntry> sampleData() => [
    const OfferEntry(
      name: 'Q1 2026 Supplier A Offers',
      supplier: 'Supplier A',
      warehouse: 'Warehouse 1',
      uploadDate: '2026-02-11',
      items: 245,
      status: 'Active',
    ),
    const OfferEntry(
      name: 'February Price List',
      supplier: 'Supplier B',
      warehouse: 'Warehouse 2',
      uploadDate: '2026-02-10',
      items: 189,
      status: 'Active',
    ),
    const OfferEntry(
      name: 'Vendor C Special Offers',
      supplier: 'Supplier C',
      warehouse: 'Warehouse 1',
      uploadDate: '2026-02-09',
      items: 156,
      status: 'Active',
    ),
    const OfferEntry(
      name: 'Bulk Purchase Deals',
      supplier: 'Supplier B',
      warehouse: 'Warehouse 3',
      uploadDate: '2026-02-08',
      items: 321,
      status: 'Active',
    ),
    const OfferEntry(
      name: 'Seasonal Products',
      supplier: 'Supplier D',
      warehouse: 'Warehouse 2',
      uploadDate: '2026-02-07',
      items: 203,
      status: 'Active',
    ),
    const OfferEntry(
      name: 'New Arrivals Q1',
      supplier: 'Supplier A',
      warehouse: 'Warehouse 1',
      uploadDate: '2026-02-06',
      items: 178,
      status: 'Active',
    ),
  ];
}

class OffersTableWidget extends StatelessWidget {
  final List<OfferEntry> entries;
  final int? sortColumnIndex;
  final bool sortAscending;
  final ValueChanged<int> onSort;
  final ValueChanged<int> onView;

  const OffersTableWidget({
    super.key,
    required this.entries,
    required this.sortColumnIndex,
    required this.sortAscending,
    required this.onSort,
    required this.onView,
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
            '${AppStrings.offers} (${entries.length})',
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

  Widget _buildSortableHeader(String label, int colIndex) {
    final isActive = sortColumnIndex == colIndex;
    return InkWell(
      onTap: () => onSort(colIndex),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: AppTextStyles.font13GreyRegular.copyWith(
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          horizontalSpace(4),
          Icon(
            isActive
                ? (sortAscending ? Icons.arrow_upward : Icons.arrow_downward)
                : Icons.swap_vert,
            size: 14.sp,
            color: isActive ? AppColors.black : AppColors.coolGrey,
          ),
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
            flex: 3,
            child: _buildSortableHeader(AppStrings.offerName, 0),
          ),
          Expanded(
            flex: 1,
            child: _buildSortableHeader(AppStrings.supplier, 1),
          ),
          Expanded(
            flex: 2,
            child: _buildSortableHeader(AppStrings.warehouse, 2),
          ),
          Expanded(
            flex: 1,
            child: _buildSortableHeader(AppStrings.uploadDate, 3),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.items,
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

  Widget _buildDataRow(OfferEntry entry, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              entry.name,
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(entry.supplier, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 2,
            child: Text(
              entry.warehouse,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.uploadDate,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.items.toString(),
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.emerald.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  AppStrings.active,
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: AppColors.emerald,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: InkWell(
              onTap: () => onView(index),
              borderRadius: BorderRadius.circular(4.r),
              child: Icon(
                Icons.visibility_outlined,
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
