import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class UploadDropzoneWidget extends StatelessWidget {
  final VoidCallback onBrowseFiles;

  const UploadDropzoneWidget({super.key, required this.onBrowseFiles});

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
            AppStrings.uploadNewFiles,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),

          // ─── Dashed Drop Area ─────────────────────
          CustomPaint(
            painter: _DashedBorderPainter(
              color: AppColors.gainsboro,
              borderRadius: 10.r,
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 48.sp,
                    color: AppColors.coolGrey,
                  ),
                  verticalSpace(12),
                  Text(
                    AppStrings.dragAndDropHere,
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  verticalSpace(6),
                  Text(
                    AppStrings.supportedFiles,
                    style: AppTextStyles.font13GreyRegular,
                  ),
                  verticalSpace(16),

                  // ─── Browse Button ───────────────
                  ElevatedButton(
                    onPressed: onBrowseFiles,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.charcoalBlack,
                      foregroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text(
                      AppStrings.browseFiles,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Custom painter for dashed border effect.
class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double borderRadius;

  _DashedBorderPainter({required this.color, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    // Draw dashed path
    const dashWidth = 6.0;
    const dashSpace = 4.0;

    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        final end = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, end.clamp(0, metric.length)),
          paint,
        );
        distance = end + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
