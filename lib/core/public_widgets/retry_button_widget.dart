import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_strings.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../helpers/spacing.dart';

class RetryButtonWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String? message;

  const RetryButtonWidget({super.key, required this.onRetry, this.message});

  @override
  Widget build(BuildContext context) {
    final hasMessage = (message ?? '').trim().isNotEmpty;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasMessage)
              Text(
                message!,
                textAlign: TextAlign.center,
                style: AppTextStyles.font14BlackRegular,
              ),
            if (hasMessage) verticalSpace(12),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, size: 18.sp),
              label: Text(AppStrings.retry),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.charcoalBlack,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
