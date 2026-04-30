import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/purchase_proposal_model.dart';

class ProposalsTableWidget extends StatelessWidget {
  final List<PurchaseProposalModel> entries;
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

  Widget _buildDataRow(PurchaseProposalModel entry, int index) {
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
              AppStrings.proposalNumber((entry.id ?? '-').toString()),
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
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
              entry.createdBy ?? '-',
              style: AppTextStyles.font13GreyRegular,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.totalCost ?? '-',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text(
              '${entry.items?.length ?? 0}',
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
    switch (status.toLowerCase()) {
      case 'approved':
        return AppStrings.approved;
      case 'rejected':
        return AppStrings.rejected;
      case 'pending':
      default:
        return AppStrings.pending;
    }
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return AppColors.emerald;
      case 'rejected':
        return AppColors.brightRed;
      case 'pending':
      default:
        return AppColors.saffronAmber;
    }
  }
}
