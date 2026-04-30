import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/available_offer_item.dart';

class OffersTableWidget extends StatelessWidget {
  final List<AvailableOfferItem> entries;
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

  Widget _buildDataRow(AvailableOfferItem entry, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              entry.originalFilename ?? '-',
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              _statusLabel(entry.status ?? ''),
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              _warehouseLabel(entry.wareHouseName),
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              _formatDate(entry.createdAt),
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              (entry.itemsCount ?? 0).toString(),
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
                  color: _statusColor(
                    entry.status ?? '',
                  ).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  _statusLabel(entry.status ?? ''),
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: _statusColor(entry.status ?? ''),
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

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    final local = date.toLocal();
    return '${local.year.toString().padLeft(4, '0')}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')}';
  }

  String _statusLabel(String status) {
    if (status.trim().isEmpty) return AppStrings.unknown;
    if (status.toLowerCase() == 'completed') {
      return AppStrings.completed;
    }
    return status;
  }

  String _warehouseLabel(String? warehouseName) {
    final value = warehouseName?.trim();
    if (value == null || value.isEmpty) {
      return AppStrings.unassigned;
    }
    return value;
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return AppColors.emerald;
      case 'failed':
        return AppColors.brightRed;
      case 'processing':
        return AppColors.saffronAmber;
      default:
        return AppColors.coolGrey;
    }
  }
}
