import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class StatCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String value;
  final String trendText;
  final bool isUp;

  const StatCardWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.value,
    required this.trendText,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Title + Icon Row ──────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    color: AppColors.coolGrey,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Icon(icon, size: 18.sp, color: iconColor),
              ),
            ],
          ),
          verticalSpace(12),

          // ─── Value + Trend Row ─────────────────────
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value, style: AppTextStyles.font28BlackBold),
              horizontalSpace(8),
              Icon(
                isUp ? Icons.trending_up : Icons.trending_down,
                size: 16.sp,
                color: isUp ? AppColors.emerald : AppColors.brightRed,
              ),
              horizontalSpace(4),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  trendText,
                  style: isUp
                      ? AppTextStyles.font12GreenSemiBold
                      : AppTextStyles.font12RedSemiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
