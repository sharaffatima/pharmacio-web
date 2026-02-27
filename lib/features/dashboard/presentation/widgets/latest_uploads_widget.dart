import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class LatestUploadsWidget extends StatelessWidget {
  const LatestUploadsWidget({super.key});

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
            AppStrings.latestUploadsStatus,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          _buildUploadItem(
            fileName: 'supplier_offers_Q1_2026.pdf',
            date: '2026-02-11 09:30',
            status: AppStrings.completed,
            statusColor: AppColors.emerald,
            statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
          ),
          _buildDivider(),
          _buildUploadItem(
            fileName: 'warehouse_inventory.xlsx',
            date: '2026-02-11 08:15',
            status: AppStrings.processing,
            statusColor: AppColors.saffronAmber,
            statusBgColor: AppColors.saffronAmber.withValues(alpha: 0.1),
          ),
          _buildDivider(),
          _buildUploadItem(
            fileName: 'price_list_vendor_A.pdf',
            date: '2026-02-10 16:45',
            status: AppStrings.completed,
            statusColor: AppColors.emerald,
            statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
          ),
          _buildDivider(),
          _buildUploadItem(
            fileName: 'offers_february.pdf',
            date: '2026-02-10 14:20',
            status: AppStrings.failed,
            statusColor: AppColors.brightRed,
            statusBgColor: AppColors.brightRed.withValues(alpha: 0.1),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadItem({
    required String fileName,
    required String date,
    required String status,
    required Color statusColor,
    required Color statusBgColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fileName, style: AppTextStyles.font13BlackMedium),
                verticalSpace(2),
                Text(date, style: AppTextStyles.font12GreyRegular),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: AppTextStyles.font12GreyRegular.copyWith(
                color: statusColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(color: AppColors.gainsboro, height: 1);
  }
}
