import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class AlertItem {
  final String title;
  final String description;
  final String severity; // Critical, Warning, Info
  final bool isResolved;

  const AlertItem({
    required this.title,
    required this.description,
    required this.severity,
    this.isResolved = false,
  });

  AlertItem copyWith({bool? isResolved}) {
    return AlertItem(
      title: title,
      description: description,
      severity: severity,
      isResolved: isResolved ?? this.isResolved,
    );
  }

  Color get severityColor {
    switch (severity) {
      case 'Critical':
        return AppColors.brightRed;
      case 'Warning':
        return AppColors.saffronAmber;
      case 'Info':
        return AppColors.skyBlue;
      default:
        return AppColors.coolGrey;
    }
  }

  Color get severityBgColor => severityColor.withValues(alpha: 0.1);

  IconData get severityIcon {
    switch (severity) {
      case 'Critical':
        return Icons.error_outline;
      case 'Warning':
        return Icons.warning_amber;
      case 'Info':
        return Icons.info_outline;
      default:
        return Icons.circle;
    }
  }

  static List<AlertItem> sampleData() => [
    const AlertItem(
      title: 'Critical Stock Level',
      description:
          'Desk Lamp LED is critically low (5 units). Immediate restock required.',
      severity: 'Critical',
    ),
    const AlertItem(
      title: 'Low Stock Warning',
      description: 'Office Chair Pro stock is below minimum threshold (15/25).',
      severity: 'Warning',
    ),
    const AlertItem(
      title: 'Price Change Detected',
      description: 'Supplier A updated prices for 12 items in Q1 2026 offer.',
      severity: 'Info',
    ),
    const AlertItem(
      title: 'Critical Stock Level',
      description:
          'Monitor 27" 4K is critically low (8 units). Immediate restock required.',
      severity: 'Critical',
    ),
    const AlertItem(
      title: 'New Upload Processed',
      description:
          'supplier_offers_Q1_2026.pdf has been processed successfully.',
      severity: 'Info',
      isResolved: true,
    ),
  ];
}

class AlertsListWidget extends StatelessWidget {
  final List<AlertItem> alerts;
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

  Widget _buildAlertCard(AlertItem alert, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: alert.isResolved ? AppColors.offWhiteGrey : AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: alert.isResolved
              ? AppColors.gainsboro
              : alert.severityColor.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Severity Icon
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: alert.severityBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              alert.severityIcon,
              size: 20.sp,
              color: alert.severityColor,
            ),
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
                      alert.title,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: alert.isResolved
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: alert.severityBgColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        alert.severity,
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          color: alert.severityColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 10.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(alert.description, style: AppTextStyles.font13GreyRegular),
              ],
            ),
          ),

          // Resolve Button
          if (!alert.isResolved)
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
}
