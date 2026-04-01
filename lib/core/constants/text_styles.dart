import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_weight_helper.dart';
import 'colors.dart';

class AppTextStyles {
  static TextStyle get font32BlackMedium => TextStyle(
    fontSize: 32.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle get font15BlackMedium => TextStyle(
    fontSize: 15.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle get font14BlackMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle get font14GreyMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.lightSlateDark,
  );
  static TextStyle get font16WhiteMedium => TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.white,
  );
  static TextStyle get font22IndigoNightBold => TextStyle(
    fontSize: 22.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.indigoNight,
  );
  static TextStyle get font14CoolGreyRegular => TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.coolGrey,
  );
  static TextStyle get font14CharcoalBlackSemiBold => TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.charcoalBlack,
  );

  // ─── Dashboard Styles ───────────────────────────────
  static TextStyle get font24BlackBold => TextStyle(
    fontSize: 24.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.black,
  );
  static TextStyle get font13GreyRegular => TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.coolGrey,
  );
  static TextStyle get font28BlackBold => TextStyle(
    fontSize: 28.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColors.black,
  );
  static TextStyle get font12GreenSemiBold => TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.emerald,
  );
  static TextStyle get font12RedSemiBold => TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.brightRed,
  );
  static TextStyle get font16BlackSemiBold => TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.semiBold,
    color: AppColors.black,
  );
  static TextStyle get font13BlackMedium => TextStyle(
    fontSize: 13.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColors.black,
  );
  static TextStyle get font12GreyRegular => TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.coolGrey,
  );
  static TextStyle get font14BlackRegular => TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColors.black,
  );
}
