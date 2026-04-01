import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/offer_model.dart';

class OffersTableWidget extends StatelessWidget {
  final List<OfferModel> entries;
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
          Divider(color: AppColors.gainsboro, height: 1),
          ...entries.asMap().entries.map((e) => _buildDataRow(e.value, e.key)),
        ],
      ),
    );
  }

  Widget _buildDataRow(OfferModel entry, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: InkWell(
        onTap: () => onView(index),
        borderRadius: BorderRadius.circular(10.r),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(entry.name)),
            Expanded(flex: 1, child: Text(entry.supplier)),
            Expanded(flex: 2, child: Text(entry.warehouse)),
            Expanded(flex: 1, child: Text(entry.uploadDate)),
            Expanded(flex: 1, child: Text(entry.itemsCount.toString())),
            Expanded(flex: 1, child: Text(entry.status)),
          ],
        ),
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
        ],
      ),
    );
  }
}
