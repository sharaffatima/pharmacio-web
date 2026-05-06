import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/app_responsive.dart';
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
    final cards = [
      _buildCard(
        value: '$total',
        label: AppStrings.totalProposals,
        color: AppColors.skyBlue,
      ),
      _buildCard(
        value: '$pending',
        label: AppStrings.pending,
        color: AppColors.saffronAmber,
      ),
      _buildCard(
        value: '$approved',
        label: AppStrings.approved,
        color: AppColors.emerald,
      ),
      _buildCard(
        value: '$rejected',
        label: AppStrings.rejected,
        color: AppColors.brightRed,
      ),
    ];

    if (AppResponsive.isMobile(context)) {
      // 2x2 grid on mobile
      final width = MediaQuery.of(context).size.width;
      final cardWidth = (width - 16.w * 2 - 12.w) / 2;
      return Wrap(
        spacing: 12.w,
        runSpacing: 12.h,
        children: cards
            .map((c) => SizedBox(width: cardWidth, child: c))
            .toList(),
      );
    }

    return Row(
      children: [
        for (var i = 0; i < cards.length; i++) ...[
          Expanded(child: cards[i]),
          if (i < cards.length - 1) horizontalSpace(16),
        ],
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
