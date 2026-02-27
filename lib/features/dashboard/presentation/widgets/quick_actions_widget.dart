import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            AppStrings.quickActions,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          _buildActionItem(
            icon: Icons.cloud_upload_outlined,
            label: AppStrings.uploadNewOffers,
            onTap: () => context.pushReplacementNamed(Routes.uploadsScreen),
          ),
          _buildActionItem(
            icon: Icons.compare_arrows,
            label: AppStrings.compareOffers,
            onTap: () => context.pushReplacementNamed(Routes.compareScreen),
          ),
          _buildActionItem(
            icon: Icons.assignment_outlined,
            label: AppStrings.viewProposals,
            onTap: () => context.pushReplacementNamed(Routes.proposalsScreen),
          ),
          _buildActionItem(
            icon: Icons.show_chart,
            label: AppStrings.manageInventory,
            onTap: () => context.pushReplacementNamed(Routes.inventoryScreen),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: AppColors.coolGrey),
            horizontalSpace(12),
            Text(label, style: AppTextStyles.font14BlackRegular),
          ],
        ),
      ),
    );
  }
}
