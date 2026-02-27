import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class ProposalsFiltersWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedStatus;
  final List<String> statuses;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onClearFilters;

  const ProposalsFiltersWidget({
    super.key,
    required this.searchController,
    required this.selectedStatus,
    required this.statuses,
    required this.onStatusChanged,
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
          Text(
            AppStrings.filterProposals,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          Row(
            children: [
              // ─── Search ───────────────────────────
              Expanded(
                flex: 3,
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
                      hintText: AppStrings.searchProposals,
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

              // ─── Status Dropdown ──────────────────
              Expanded(
                flex: 1,
                child: Container(
                  height: 40.h,
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gainsboro),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedStatus,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 20.sp,
                        color: AppColors.coolGrey,
                      ),
                      style: AppTextStyles.font14BlackRegular,
                      items: statuses
                          .map(
                            (s) => DropdownMenuItem(value: s, child: Text(s)),
                          )
                          .toList(),
                      onChanged: (v) {
                        if (v != null) onStatusChanged(v);
                      },
                    ),
                  ),
                ),
              ),
              horizontalSpace(12),

              // ─── Date Range ───────────────────────
              OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.calendar_today,
                  size: 16.sp,
                  color: AppColors.coolGrey,
                ),
                label: Text(
                  AppStrings.dateRange,
                  style: AppTextStyles.font14BlackRegular,
                ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
