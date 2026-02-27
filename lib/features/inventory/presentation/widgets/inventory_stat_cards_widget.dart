import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class InventoryStatCardsWidget extends StatelessWidget {
  final int totalItems;
  final int lowStockItems;
  final int totalStockValue;

  const InventoryStatCardsWidget({
    super.key,
    required this.totalItems,
    required this.lowStockItems,
    required this.totalStockValue,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(
            label: AppStrings.totalItems,
            value: '$totalItems',
            color: AppColors.black,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            label: AppStrings.lowStockItems,
            value: '$lowStockItems',
            color: AppColors.brightRed,
            icon: Icons.warning_amber_rounded,
            iconColor: AppColors.brightRed,
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: _buildCard(
            label: AppStrings.totalStockValue,
            value: '$totalStockValue',
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String label,
    required String value,
    required Color color,
    IconData? icon,
    Color? iconColor,
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
          if (icon != null)
            Icon(icon, size: 32.sp, color: iconColor ?? AppColors.coolGrey),
        ],
      ),
    );
  }
}
