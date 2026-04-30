import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class UploadDropzoneWidget extends StatefulWidget {
  final ValueChanged<String> onBrowseFiles;
  final bool isUploading;

  const UploadDropzoneWidget({
    super.key,
    required this.onBrowseFiles,
    this.isUploading = false,
  });

  @override
  State<UploadDropzoneWidget> createState() => _UploadDropzoneWidgetState();
}

class _UploadDropzoneWidgetState extends State<UploadDropzoneWidget> {
  final TextEditingController _warehouseController = TextEditingController();
  String? _validationError;

  @override
  void dispose() {
    _warehouseController.dispose();
    super.dispose();
  }

  void _handleBrowseTap() {
    final value = _warehouseController.text.trim();
    if (value.isEmpty) {
      setState(() {
        _validationError = AppStrings.warehouseNameRequired;
      });
      return;
    }
    setState(() {
      _validationError = null;
    });
    widget.onBrowseFiles(value);
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.isUploading;

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

          // ─── Warehouse Name Field ─────────────────
          Text(
            AppStrings.warehouseNameLabel,
            style: AppTextStyles.font13BlackMedium,
          ),
          verticalSpace(8),
          TextField(
            controller: _warehouseController,
            enabled: !isDisabled,
            style: AppTextStyles.font14BlackRegular,
            decoration: InputDecoration(
              hintText: AppStrings.warehouseNameHint,
              hintStyle: AppTextStyles.font13GreyRegular,
              filled: true,
              fillColor: AppColors.offWhiteGrey,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              errorText: _validationError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.gainsboro),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.gainsboro),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: AppColors.skyBlue, width: 1.5),
              ),
            ),
            onChanged: (_) {
              if (_validationError != null) {
                setState(() {
                  _validationError = null;
                });
              }
            },
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
                    isDisabled
                        ? Icons.hourglass_top_outlined
                        : Icons.cloud_upload_outlined,
                    size: 48.sp,
                    color: AppColors.coolGrey,
                  ),
                  verticalSpace(12),
                  Text(
                    isDisabled
                        ? AppStrings.processingDocumentNotice
                        : AppStrings.dragAndDropHere,
                    style: AppTextStyles.font16BlackSemiBold,
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(6),
                  Text(
                    AppStrings.supportedFiles,
                    style: AppTextStyles.font13GreyRegular,
                  ),
                  verticalSpace(16),

                  // ─── Browse Button ───────────────
                  ElevatedButton(
                    onPressed: isDisabled ? null : _handleBrowseTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.charcoalBlack,
                      foregroundColor: AppColors.white,
                      disabledBackgroundColor: AppColors.gainsboro,
                      disabledForegroundColor: AppColors.coolGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: isDisabled
                        ? SizedBox(
                            height: 18.sp,
                            width: 18.sp,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.coolGrey,
                              ),
                            ),
                          )
                        : Text(
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
