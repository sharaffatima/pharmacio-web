import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class SelectionSummaryWidget extends StatelessWidget {
  final int selectedCount;
  final int comparedItemsCount;
  final VoidCallback onCompare;
  final VoidCallback onGenerateProposal;

  const SelectionSummaryWidget({
    super.key,
    required this.selectedCount,
    required this.comparedItemsCount,
    required this.onCompare,
    required this.onGenerateProposal,
  });

  @override
  Widget build(BuildContext context) {
    final canCompare = selectedCount >= 2;
    final canGenerate = selectedCount >= 2 && comparedItemsCount > 0;

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        children: [
          Text(
            AppStrings.selectionSummary,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(20),

          // ─── Counter ──────────────────────────────
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h),
            decoration: BoxDecoration(
              color: AppColors.skyBlue.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Text(
                  '$selectedCount',
                  style: AppTextStyles.font28BlackBold.copyWith(
                    color: AppColors.skyBlue,
                  ),
                ),
                verticalSpace(4),
                Text(
                  AppStrings.offersSelected,
                  style: AppTextStyles.font13GreyRegular,
                ),
              ],
            ),
          ),
          verticalSpace(20),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              color: AppColors.offWhiteGrey,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                Text(
                  '$comparedItemsCount',
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                verticalSpace(2),
                Text(
                  AppStrings.comparedItems,
                  style: AppTextStyles.font12GreyRegular,
                ),
              ],
            ),
          ),
          verticalSpace(16),

          // ─── Compare Button ───────────────────────
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: canCompare ? onCompare : null,
              icon: Icon(Icons.compare_arrows, size: 20.sp),
              label: Text(AppStrings.compareOffersAction),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.charcoalBlack,
                foregroundColor: AppColors.white,
                disabledBackgroundColor: AppColors.gainsboro,
                disabledForegroundColor: AppColors.coolGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
          ),
          verticalSpace(10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: canGenerate ? onGenerateProposal : null,
              icon: Icon(Icons.description_outlined, size: 20.sp),
              label: Text(AppStrings.generateProposalAction),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.charcoalBlack,
                disabledForegroundColor: AppColors.coolGrey,
                side: BorderSide(color: AppColors.gainsboro),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.h),
              ),
            ),
          ),
          verticalSpace(12),

          // ─── Hint Text ────────────────────────────
          if (!canCompare)
            Text(
              AppStrings.selectAtLeast2,
              style: AppTextStyles.font12GreyRegular,
              textAlign: TextAlign.center,
            ),
          if (canCompare && !canGenerate)
            Text(
              AppStrings.compareBeforeGenerate,
              style: AppTextStyles.font12GreyRegular,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
