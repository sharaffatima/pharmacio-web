import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../data/models/proposal_item_model.dart';
import '../../data/models/purchase_proposal_model.dart';

class ProposalDetailsScreen extends StatelessWidget {
  final PurchaseProposalModel proposal;

  const ProposalDetailsScreen({super.key, required this.proposal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 4),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  verticalSpace(24),
                  _buildSummaryCard(),
                  verticalSpace(24),
                  _buildItemsCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.gainsboro),
            ),
            child: Icon(
              Icons.arrow_back,
              size: 20.sp,
              color: AppColors.charcoalBlack,
            ),
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.proposalNumber((proposal.id ?? '-').toString()),
                style: AppTextStyles.font24BlackBold,
              ),
              verticalSpace(2),
              Text(
                AppStrings.proposalDetailsSubtitle,
                style: AppTextStyles.font14GreyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
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
            AppStrings.proposalSummary,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              _buildInfoTile(
                label: AppStrings.status,
                value: _statusLabel(proposal.status ?? ""),
                statusColor: _statusColor(proposal.status ?? ""),
              ),
              _buildInfoTile(
                label: AppStrings.totalCostLabel,
                value: proposal.totalCost ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.items,
                value: (proposal.items ?? []).length.toString(),
              ),
              _buildInfoTile(
                label: AppStrings.createdBy,
                value: proposal.createdBy ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.approvedByLabel,
                value: proposal.approvedBy ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.createdAtLabel,
                value: _formatDateTime(proposal.createdAt),
              ),
              _buildInfoTile(
                label: AppStrings.updatedAtLabel,
                value: _formatDateTime(proposal.updatedAt),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required String label,
    required String value,
    Color? statusColor,
  }) {
    final hasStatus = statusColor != null;

    return Container(
      width: 210.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.font12GreyRegular),
          verticalSpace(2),
          if (!hasStatus)
            Text(
              value,
              style: AppTextStyles.font14BlackRegular,
              overflow: TextOverflow.ellipsis,
            ),
          if (hasStatus)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                value,
                style: AppTextStyles.font12GreyRegular.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildItemsCard() {
    final items = proposal.items ?? const <ProposalItemModel>[];

    return Container(
      width: double.infinity,
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
            AppStrings.proposalItems,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(14),
          _buildItemsHeader(),
          verticalSpace(8),
          if (items.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(
                AppStrings.noItemsFound,
                style: AppTextStyles.font13GreyRegular,
              ),
            ),
          if (items.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: AppColors.gainsboro),
              itemBuilder: (_, index) {
                final item = items[index];
                return _buildItemRow(item);
              },
            ),
        ],
      ),
    );
  }

  Widget _buildItemsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              AppStrings.product,
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              AppStrings.company,
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            child: Text(AppStrings.qty, style: AppTextStyles.font13BlackMedium),
          ),
          Expanded(
            child: Text(
              AppStrings.unit,
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            child: Text(
              AppStrings.total,
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(ProposalItemModel item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '${item.productName ?? '-'}${item.strength == null || item.strength!.isEmpty ? '' : ' (${item.strength})'}',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              item.company ?? '-',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            child: Text(
              item.proposedQuantity?.toString() ?? '0',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            child: Text(
              item.unitPrice ?? '-',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            child: Text(
              item.lineTotal ?? '-',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final local = dateTime.toLocal();
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$year-$month-$day  $hour:$minute';
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
