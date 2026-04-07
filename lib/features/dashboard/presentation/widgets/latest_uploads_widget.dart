import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/dashboard_recent_activity_item.dart';

class LatestUploadsWidget extends StatelessWidget {
  final List<DashboardRecentActivityItem> activities;

  const LatestUploadsWidget({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    final topActivities = activities.take(10).toList();

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
          if (activities.isEmpty)
            Text(
              AppStrings.noRecentActivity,
              style: AppTextStyles.font13GreyRegular,
            )
          else
            ...topActivities.asMap().entries.expand((entry) {
              final index = entry.key;
              final item = entry.value;
              final colors = _themeColors(item.theme ?? '');

              final row = _buildUploadItem(
                icon: _iconFromApi(item.icon ?? ''),
                fileName: item.message ?? '-',
                date: _formatDate(item.createdAt),
                status: item.actor ?? '-',
                statusColor: colors.$1,
                statusBgColor: colors.$2,
              );

              if (index == topActivities.length - 1) {
                return [row];
              }

              return [row, _buildDivider()];
            }),
        ],
      ),
    );
  }

  Widget _buildUploadItem({
    required IconData icon,
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
          Container(
            margin: EdgeInsetsDirectional.only(end: 10.w),
            padding: EdgeInsets.all(6.r),
            decoration: BoxDecoration(
              color: statusBgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 16.sp, color: statusColor),
          ),
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

  IconData _iconFromApi(String icon) {
    switch (icon.toLowerCase()) {
      case 'upload':
        return Icons.upload_file_outlined;
      case 'box':
        return Icons.inventory_2_outlined;
      case 'cash':
        return Icons.payments_outlined;
      default:
        return Icons.notifications_none;
    }
  }

  (Color, Color) _themeColors(String theme) {
    switch (theme.toLowerCase()) {
      case 'green':
        return (AppColors.emerald, AppColors.emerald.withValues(alpha: 0.1));
      case 'red':
        return (
          AppColors.brightRed,
          AppColors.brightRed.withValues(alpha: 0.1),
        );
      case 'amber':
      case 'yellow':
        return (
          AppColors.saffronAmber,
          AppColors.saffronAmber.withValues(alpha: 0.1),
        );
      default:
        return (AppColors.skyBlue, AppColors.skyBlue.withValues(alpha: 0.1));
    }
  }

  String _formatDate(DateTime? value) {
    if (value == null) return '-';
    final local = value.toLocal();
    final date =
        '${local.year.toString().padLeft(4, '0')}-${local.month.toString().padLeft(2, '0')}-${local.day.toString().padLeft(2, '0')}';
    final time =
        '${local.hour.toString().padLeft(2, '0')}:${local.minute.toString().padLeft(2, '0')}';
    return '$date $time';
  }
}
