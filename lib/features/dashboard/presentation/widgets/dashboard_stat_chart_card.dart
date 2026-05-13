import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class DashboardStatChartCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final int value;
  final List<double> series;
  final int maxValue;

  const DashboardStatChartCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.value,
    required this.series,
    required this.maxValue,
  });

  @override
  Widget build(BuildContext context) {
    final displayValue = value.toString();
    final progress = maxValue > 0 ? value / maxValue : 0.0;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
        gradient: LinearGradient(
          colors: [iconBgColor.withValues(alpha: 0.16), AppColors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          verticalSpace(10),
          Row(
            children: [
              Text(displayValue, style: AppTextStyles.font26BlackBold),
              horizontalSpace(10),
              Expanded(
                child: _ProgressBar(value: progress, color: iconColor),
              ),
            ],
          ),
          verticalSpace(10),
          Text('Last 7 days', style: AppTextStyles.font12GreyRegular),
          verticalSpace(6),
          SizedBox(
            height: 56.h,
            child: CustomPaint(
              painter: _SparklinePainter(series: series, lineColor: iconColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final double value;
  final Color color;

  const _ProgressBar({required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        color: AppColors.gainsboro,
        borderRadius: BorderRadius.circular(99.r),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth * value.clamp(0.0, 1.0);
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(99.r),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> series;
  final Color lineColor;

  _SparklinePainter({required this.series, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    if (series.isEmpty) return;

    final maxValue = series.reduce(max);
    final minValue = series.reduce(min);
    final range = maxValue - minValue;

    if (range == 0) {
      final paint = Paint()
        ..color = lineColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke;
      canvas.drawLine(
        Offset(0, size.height / 2),
        Offset(size.width, size.height / 2),
        paint,
      );
      return;
    }

    final step = size.width / (series.length - 1);
    final path = Path();

    for (var i = 0; i < series.length; i++) {
      final x = step * i;
      final normalized = (series[i] - minValue) / range;
      final y = size.height - (normalized * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          lineColor.withValues(alpha: 0.18),
          lineColor.withValues(alpha: 0.02),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.series != series || oldDelegate.lineColor != lineColor;
  }
}
