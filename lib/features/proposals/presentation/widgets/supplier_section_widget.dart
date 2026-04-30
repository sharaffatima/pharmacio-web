import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/proposal_item_model.dart';

/// Renders a single supplier's section inside the proposal details
/// view: a colored header with supplier name + items count + subtotal,
/// followed by the items belonging to that supplier.
class SupplierSectionWidget extends StatelessWidget {
  final String supplierName;
  final List<ProposalItemModel> items;
  final String? subtotalDisplay;

  const SupplierSectionWidget({
    super.key,
    required this.supplierName,
    required this.items,
    this.subtotalDisplay,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSupplierHeader(context, isMobile),
          if (!isMobile) _buildItemsHeaderRow(),
          if (items.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Text(
                AppStrings.noItemsFound,
                style: AppTextStyles.font13GreyRegular,
              ),
            )
          else
            ...items
                .asMap()
                .entries
                .map((e) => _buildItemRow(e.value, e.key, isMobile)),
        ],
      ),
    );
  }

  // ─── Supplier Header ─────────────────────────────────
  Widget _buildSupplierHeader(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.skyBlue.withValues(alpha: 0.06),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColors.skyBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.business_outlined,
              size: 18.sp,
              color: AppColors.skyBlue,
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  supplierName,
                  style: AppTextStyles.font16BlackSemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(2),
                Text(
                  AppStrings.supplierItemsCount(items.length),
                  style: AppTextStyles.font12GreyRegular,
                ),
              ],
            ),
          ),
          if (subtotalDisplay != null && subtotalDisplay!.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: AppColors.gainsboro),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppStrings.supplierSubtotalLabel,
                    style: AppTextStyles.font12GreyRegular,
                  ),
                  Text(
                    subtotalDisplay!,
                    style: AppTextStyles.font13BlackMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.skyBlue,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // ─── Items Header (desktop/tablet only) ──────────────
  Widget _buildItemsHeaderRow() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              AppStrings.product,
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            child: Text(
              AppStrings.qty,
              style: AppTextStyles.font13BlackMedium,
            ),
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

  // ─── Item Row (responsive: card on mobile, row on desktop) ─
  Widget _buildItemRow(ProposalItemModel item, int index, bool isMobile) {
    final productLabel =
        '${item.productName ?? '-'}${item.strength == null || item.strength!.isEmpty ? '' : ' (${item.strength})'}';
    final isLast = index == items.length - 1;

    if (isMobile) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(
                  bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productLabel,
              style: AppTextStyles.font13BlackMedium,
            ),
            verticalSpace(6),
            Row(
              children: [
                _kv(AppStrings.qty, item.proposedQuantity?.toString() ?? '0'),
                horizontalSpace(16),
                _kv(AppStrings.unit, item.unitPrice ?? '-'),
                horizontalSpace(16),
                _kv(AppStrings.total, item.lineTotal ?? '-'),
              ],
            ),
          ],
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
              ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              productLabel,
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

  Widget _kv(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.font12GreyRegular),
        verticalSpace(2),
        Text(value, style: AppTextStyles.font13BlackMedium),
      ],
    );
  }
}
