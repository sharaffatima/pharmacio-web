import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/purchase_proposal_item_model.dart';
import '../../data/models/purchase_proposal_model.dart';

class ProposalsTableWidget extends StatelessWidget {
  final List<PurchaseProposalModel> entries;
  final void Function(PurchaseProposalModel proposal) onApprove;
  final void Function(PurchaseProposalModel proposal) onReject;
  final void Function(PurchaseProposalModel proposal) onViewDetail;

  const ProposalsTableWidget({
    super.key,
    required this.entries,
    required this.onApprove,
    required this.onReject,
    required this.onViewDetail,
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
            '${AppStrings.purchaseProposals} (${entries.length})',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          _buildHeaderRow(),
          Divider(color: AppColors.gainsboro, height: 1),
          ...entries.map((e) => _buildDataRow(context, e)),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Text('#', style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 2,
            child: Text(AppStrings.createdBy, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text(AppStrings.totalValue, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text('Items', style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text(AppStrings.status, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text(AppStrings.createdDate, style: AppTextStyles.font13GreyRegular),
          ),
          SizedBox(
            width: 110.w,
            child: Text(AppStrings.actions, style: AppTextStyles.font13GreyRegular),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(BuildContext context, PurchaseProposalModel entry) {
    final statusColor = _statusColor(entry.status);
    final statusBg = statusColor.withValues(alpha: 0.1);
    final isPending = entry.status == 'pending';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50.w,
            child: Text('#${entry.id}', style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 2,
            child: Text(
              entry.createdBy,
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(entry.totalCost, style: AppTextStyles.font13GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text('${entry.items.length}', style: AppTextStyles.font13GreyRegular),
          ),
          // Status badge
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  _capitalize(entry.status),
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              entry.createdAt.length >= 10
                  ? entry.createdAt.substring(0, 10)
                  : entry.createdAt,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          // Actions
          SizedBox(
            width: 110.w,
            child: Row(
              children: [
                // View detail — triggers GET /purchase-proposals/{id}/
                InkWell(
                  onTap: () => _showDetailDialog(context, entry),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Icon(
                      Icons.visibility_outlined,
                      size: 20.sp,
                      color: AppColors.skyBlue,
                    ),
                  ),
                ),
                horizontalSpace(4),
                if (isPending) ...[
                  // Approve — triggers POST /purchase-proposals/{id}/approve/
                  InkWell(
                    onTap: () => _confirmApprove(context, entry),
                    borderRadius: BorderRadius.circular(4.r),
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Icon(
                        Icons.check_circle_outline,
                        size: 20.sp,
                        color: AppColors.emerald,
                      ),
                    ),
                  ),
                  horizontalSpace(4),
                  // Reject — triggers POST /purchase-proposals/{id}/reject/
                  InkWell(
                    onTap: () => _confirmReject(context, entry),
                    borderRadius: BorderRadius.circular(4.r),
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: Icon(
                        Icons.cancel_outlined,
                        size: 20.sp,
                        color: AppColors.brightRed,
                      ),
                    ),
                  ),
                ] else
                  Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Icon(
                      Icons.lock_outline,
                      size: 20.sp,
                      color: AppColors.coolGrey,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Detail Dialog — uses GET /purchase-proposals/{id}/ data (already loaded) ──
  void _showDetailDialog(BuildContext context, PurchaseProposalModel entry) {
    // We already have the full proposal with items from the list endpoint.
    // onViewDetail triggers getProposalDetail from cubit for fresh data.
    onViewDetail(entry);

    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        child: Container(
          width: 600.w,
          constraints: BoxConstraints(maxHeight: 500.h),
          padding: EdgeInsets.all(24.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Proposal #${entry.id}',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
              verticalSpace(8),
              // Meta info
              Row(
                children: [
                  _metaChip('Status', _capitalize(entry.status), _statusColor(entry.status)),
                  horizontalSpace(8),
                  _metaChip('Total', entry.totalCost, AppColors.skyBlue),
                  horizontalSpace(8),
                  _metaChip('By', entry.createdBy, AppColors.coolGrey),
                ],
              ),
              verticalSpace(16),
              Divider(color: AppColors.gainsboro, height: 1),
              verticalSpace(12),
              // Items header
              Text(
                'Items (${entry.items.length})',
                style: AppTextStyles.font14BlackRegular.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpace(8),
              // Items table
              Expanded(
                child: entry.items.isEmpty
                    ? Center(
                        child: Text(
                          'No items',
                          style: AppTextStyles.font13GreyRegular,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildItemsHeader(),
                            ...entry.items.map(_buildItemRow),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _metaChip(String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$label: ',
              style: AppTextStyles.font12GreyRegular,
            ),
            TextSpan(
              text: value,
              style: AppTextStyles.font12GreyRegular.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemsHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 1),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Product', style: AppTextStyles.font12GreyRegular)),
          Expanded(flex: 1, child: Text('Strength', style: AppTextStyles.font12GreyRegular)),
          Expanded(flex: 1, child: Text('Warehouse', style: AppTextStyles.font12GreyRegular)),
          SizedBox(width: 50.w, child: Text('Qty', style: AppTextStyles.font12GreyRegular)),
          SizedBox(width: 70.w, child: Text('Unit Price', style: AppTextStyles.font12GreyRegular)),
          SizedBox(width: 70.w, child: Text('Total', style: AppTextStyles.font12GreyRegular)),
        ],
      ),
    );
  }

  Widget _buildItemRow(PurchaseProposalItemModel item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              item.productName,
              style: AppTextStyles.font12GreyRegular.copyWith(
                color: AppColors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(item.strength, style: AppTextStyles.font12GreyRegular),
          ),
          Expanded(
            flex: 1,
            child: Text(
              item.wareHouseName,
              style: AppTextStyles.font12GreyRegular,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 50.w,
            child: Text('${item.proposedQuantity}', style: AppTextStyles.font12GreyRegular),
          ),
          SizedBox(
            width: 70.w,
            child: Text(item.unitPrice, style: AppTextStyles.font12GreyRegular),
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              item.lineTotal,
              style: AppTextStyles.font12GreyRegular.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'approved':
        return AppColors.emerald;
      case 'rejected':
        return AppColors.brightRed;
      default:
        return AppColors.saffronAmber;
    }
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}';

  void _confirmApprove(BuildContext context, PurchaseProposalModel entry) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: Text('Approve Proposal #${entry.id}?', style: AppTextStyles.font16BlackSemiBold),
        content: Text(
          'Total cost: ${entry.totalCost}\nThis action cannot be undone.',
          style: AppTextStyles.font14CoolGreyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: AppTextStyles.font14CoolGreyRegular),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emerald,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onApprove(entry);
            },
            child: Text(
              'Approve',
              style: AppTextStyles.font14BlackRegular.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmReject(BuildContext context, PurchaseProposalModel entry) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        title: Text('Reject Proposal #${entry.id}?', style: AppTextStyles.font16BlackSemiBold),
        content: Text(
          'Are you sure you want to reject this proposal?',
          style: AppTextStyles.font14CoolGreyRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel', style: AppTextStyles.font14CoolGreyRegular),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brightRed,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              onReject(entry);
            },
            child: Text(
              'Reject',
              style: AppTextStyles.font14BlackRegular.copyWith(color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
