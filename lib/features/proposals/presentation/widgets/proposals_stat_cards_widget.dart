import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class ProposalsStatCardsWidget extends StatelessWidget {
  final int total;
  final int pending;
  final int approved;
  final int rejected;

  const ProposalsStatCardsWidget({
    super.key,
    required this.total,
    required this.pending,
    required this.approved,
    required this.rejected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            value: '$total',
            label: AppStrings.totalProposals,
            color: AppColors.skyBlue,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            value: '$pending',
            label: AppStrings.pending,
            color: AppColors.saffronAmber,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            value: '$approved',
            label: AppStrings.approved,
            color: AppColors.emerald,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            value: '$rejected',
            label: AppStrings.rejected,
            color: AppColors.brightRed,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.font28BlackBold.copyWith(color: color),
          ),
          verticalSpace(4),
          Text(label, style: AppTextStyles.font13GreyRegular),
        ],
      ),
    );
  }
}
