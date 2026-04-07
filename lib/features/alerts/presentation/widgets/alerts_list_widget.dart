import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/user_notification_model.dart';

class AlertsListWidget extends StatelessWidget {
  static const String _severityCriticalKey = 'critical';
  static const String _severityWarningKey = 'warning';
  static const String _severityInfoKey = 'info';

  final List<UserNotificationModel> alerts;
  final ValueChanged<int> onResolve;

  const AlertsListWidget({
    super.key,
    required this.alerts,
    required this.onResolve,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${AppStrings.activeAndRecent} (${alerts.length})',
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          ...alerts.asMap().entries.map((e) => _buildAlertCard(e.value, e.key)),
        ],
      ),
    );
  }

  Widget _buildAlertCard(UserNotificationModel alert, int index) {
    final isRead = alert.isRead ?? false;
    final severity = _severityFromType(alert.type ?? '');
    final severityColor = _severityColor(severity);
    final severityBgColor = severityColor.withValues(alpha: 0.1);
    final severityIcon = _severityIcon(severity);
    final severityLabel = _severityLabel(severity);
    final title = _titleFromType(alert.type ?? '');

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isRead ? AppColors.offWhiteGrey : AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isRead
              ? AppColors.gainsboro
              : severityColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Severity Icon
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: severityBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(severityIcon, size: 20.sp, color: severityColor),
          ),
          horizontalSpace(16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: isRead ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: severityBgColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        severityLabel,
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          color: severityColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(
                  alert.message ?? '-',
                  style: AppTextStyles.font13GreyRegular,
                ),
              ],
            ),
          ),

          // Resolve Button
          if (!isRead)
            OutlinedButton.icon(
              onPressed: () => onResolve(index),
              icon: Icon(
                Icons.check_circle_outline,
                size: 16.sp,
                color: AppColors.coolGrey,
              ),
              label: Text(
                AppStrings.resolve,
                style: AppTextStyles.font13GreyRegular,
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: AppColors.gainsboro),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              ),
            ),
        ],
      ),
    );
  }

  String _severityFromType(String type) {
    final value = type.toLowerCase();
    if (value.contains('low_stock')) return _severityCriticalKey;
    if (value.contains('warning')) return _severityWarningKey;
    return _severityInfoKey;
  }

  String _severityLabel(String severity) {
    switch (severity) {
      case _severityCriticalKey:
        return AppStrings.severityCritical;
      case _severityWarningKey:
        return AppStrings.severityWarning;
      case _severityInfoKey:
      default:
        return AppStrings.severityInfo;
    }
  }

  String _titleFromType(String type) {
    final value = type.toLowerCase();
    if (value.contains('low_stock')) return AppStrings.alertTitleLowStock;
    if (value.contains('inventory')) return AppStrings.alertTitleInventory;
    if (value.contains('sale')) return AppStrings.alertTitleSales;
    if (value.contains('file')) return AppStrings.alertTitleUpload;
    return AppStrings.alertTitleNotification;
  }

  Color _severityColor(String severity) {
    switch (severity) {
      case _severityCriticalKey:
        return AppColors.brightRed;
      case _severityWarningKey:
        return AppColors.saffronAmber;
      default:
        return AppColors.skyBlue;
    }
  }

  IconData _severityIcon(String severity) {
    switch (severity) {
      case _severityCriticalKey:
        return Icons.error_outline;
      case _severityWarningKey:
        return Icons.warning_amber;
      default:
        return Icons.info_outline;
    }
  }
}
