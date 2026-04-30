import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class AlertsStatCardsWidget extends StatelessWidget {
  final int activeAlerts;
  final int criticalAlerts;
  final int resolvedToday;

  const AlertsStatCardsWidget({
    super.key,
    required this.activeAlerts,
    required this.criticalAlerts,
    required this.resolvedToday,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            label: AppStrings.activeAlertsCount,
            value: '$activeAlerts',
            color: AppColors.black,
            icon: Icons.notifications_outlined,
            iconColor: AppColors.coolGrey,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            label: AppStrings.criticalAlerts,
            value: '$criticalAlerts',
            color: AppColors.brightRed,
            icon: Icons.error_outline,
            iconColor: AppColors.brightRed,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            label: AppStrings.resolvedToday,
            value: '$resolvedToday',
            color: AppColors.emerald,
            icon: Icons.check_circle_outline,
            iconColor: AppColors.emerald,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String label,
    required String value,
    required Color color,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.font13GreyRegular),
              verticalSpace(8),
              Text(
                value,
                style: AppTextStyles.font28BlackBold.copyWith(color: color),
              ),
            ],
          ),
          Icon(icon, size: 32.sp, color: iconColor),
        ],
      ),
    );
  }
}
