import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class ProposalEntry {
  final String name;
  final String createdDate;
  final String createdBy;
  final String totalValue;
  final int items;
  final String status;

  const ProposalEntry({
    required this.name,
    required this.createdDate,
    required this.createdBy,
    required this.totalValue,
    required this.items,
    required this.status,
  });

  static List<ProposalEntry> sampleData() => [
    const ProposalEntry(
      name: 'Q1 2026 Office Equipment',
      createdDate: '2026-02-11',
      createdBy: 'Admin User',
      totalValue: '\$15,240.50',
      items: 24,
      status: 'Pending',
    ),
    const ProposalEntry(
      name: 'February IT Hardware Purchase',
      createdDate: '2026-02-10',
      createdBy: 'Admin User',
      totalValue: '\$32,450.75',
      items: 18,
      status: 'Approved',
    ),
    const ProposalEntry(
      name: 'Warehouse Supplies Bulk Order',
      createdDate: '2026-02-09',
      createdBy: 'Admin User',
      totalValue: '\$8,920.30',
      items: 45,
      status: 'Pending',
    ),
    const ProposalEntry(
      name: 'January Office Furniture',
      createdDate: '2026-02-05',
      createdBy: 'Admin User',
      totalValue: '\$12,340.00',
      items: 12,
      status: 'Approved',
    ),
    const ProposalEntry(
      name: 'Seasonal Products Procurement',
      createdDate: '2026-02-03',
      createdBy: 'Admin User',
      totalValue: '\$6,780.25',
      items: 32,
      status: 'Rejected',
    ),
  ];

  Color get statusColor {
    switch (status) {
      case 'Pending':
        return AppColors.saffronAmber;
      case 'Approved':
        return AppColors.emerald;
      case 'Rejected':
        return AppColors.brightRed;
      default:
        return AppColors.coolGrey;
    }
  }

  Color get statusBgColor => statusColor.withValues(alpha: 0.1);
}

class ProposalsTableWidget extends StatelessWidget {
  final List<ProposalEntry> entries;
  final ValueChanged<int> onView;

  const ProposalsTableWidget({
    super.key,
    required this.entries,
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
            '${AppStrings.proposals} (${entries.length})',
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
            flex: 3,
            child: Text(
              AppStrings.proposalName,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.createdDate,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.createdBy,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.totalValue,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 50.w,
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

  Widget _buildDataRow(ProposalEntry entry, int index) {
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
              entry.name,
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.createdDate,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.createdBy,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.totalValue,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text(
              '${entry.items}',
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
                  color: entry.statusBgColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  entry.status,
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: entry.statusColor,
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
