import 'package:flutter/material.dart';

class AppColors {
  static bool isDarkMode = false;

  // ─── Semantic Colors (theme-aware) ─────────────────
  static Color get white => isDarkMode ? const Color(0xFF1E1E2E) : Colors.white;
  static Color get black => isDarkMode ? const Color(0xFFE0E0E0) : Colors.black;
  static Color get offWhiteGrey =>
      isDarkMode ? const Color(0xFF121218) : const Color(0xFFF7F7F7);
  static Color get gainsboro =>
      isDarkMode ? const Color(0xFF2E2E3E) : const Color(0xFFEDEDED);
  static Color get coolGrey =>
      isDarkMode ? const Color(0xFFA0A0B0) : const Color(0xFF707070);
  static Color get charcoalBlack =>
      isDarkMode ? const Color(0xFFF0F0F0) : const Color(0xFF1A1A1A);
  static Color get grey => isDarkMode ? const Color(0xFF888898) : Colors.grey;
  static Color get slate =>
      isDarkMode ? const Color(0xFFB0B0C0) : const Color(0xFF757575);
  static Color get darkSlate =>
      isDarkMode ? const Color(0xFFC0C0D0) : const Color(0xFF616161);
  static Color get dustyGrey =>
      isDarkMode ? const Color(0xFF909090) : const Color(0xFFA8A7A7);
  static Color get greyStone =>
      isDarkMode ? const Color(0xFFB0B0B0) : const Color(0xFF777777);
  static Color get lightSlate =>
      isDarkMode ? const Color(0xFFB0BEC5) : const Color(0xFF94A3B8);
  static Color get lightSlateDark =>
      isDarkMode ? const Color(0xFFA8A0A0) : const Color(0xFF8A8080);
  static Color get offWhiteBlue =>
      isDarkMode ? const Color(0xFF1A1A2A) : const Color(0xFFFDFDFF);
  static Color get lightGreyText =>
      isDarkMode ? const Color(0xFF606070) : const Color(0xFFC2C2C2);
  static Color get blueGrey =>
      isDarkMode ? const Color(0xFFB0C4DE) : const Color(0xFF334155);
  static Color get indigoNight =>
      isDarkMode ? const Color(0xFFE8E8F0) : const Color(0xFF0E162A);
  static Color get charcoal =>
      isDarkMode ? const Color(0xFFD0D0D0) : const Color(0xFF242424);

  // ─── Card / Container backgrounds ──────────────────
  static Color get midnightBlue =>
      isDarkMode ? const Color(0xFF252535) : const Color(0xFF1A1F3A);

  // ─── Static accent colors (same in both themes) ────
  static const Color whiteOpacity30 = Colors.white30;
  static const Color teaDark = Color(0xFF005555);
  static const Color forestGreen = Color(0xff049A2E);
  static const Color lightMintGreen = Color(0xffD5FFDD);
  static const Color jetBlack = Color(0xff020618);
  static const Color royalBlue = Color(0xFF123DDB);
  static const Color lavender = Color(0xFF9380FF);
  static const Color skyBlue = Color(0xFF3B82F6);
  static const Color lightBlue = Color(0xFFE6EEFF);
  static const Color darkOrange = Color(0xFFFF7300);
  static const Color apricot = Color.fromARGB(255, 232, 131, 49);
  static const Color peach = Color.fromARGB(255, 237, 174, 123);
  static const Color orangeYellow = Color(0xFFFFA931);
  static const Color oceanTeal = Color(0xFF26A69A);
  static const Color mintGreen = Color(0xFF48F492);
  static const Color limeGreen = Color(0xFF28BD20);
  static const Color crimson = Color(0xFFF20000);
  static Color coral = const Color(0xFFEF4444).withValues(alpha: 0.2);
  static const Color golden = Color(0xFFFFD106);
  static const Color sandy = Color(0xFFF0DB80);
  static const Color saffron = Color(0xFFFBBF24);
  static const Color rosePink = Color(0xFFF7B2B2);
  static Color violet = const Color(0xFF8B5CF6).withValues(alpha: 0.2);

  // ─── Status Colors ─────────────────────────────────
  static const Color emerald = Color(0xFF10B981);
  static const Color saffronAmber = Color(0xFFF59E0B);
  static const Color greyBlue = Color(0xFF64748B);
  static const Color brightRed = Color(0xFFEF4444);

  // ─── Alert Colors ──────────────────────────────────
  static const Color alertLowBlue = Color(0xFF3B82F6);
  static const Color alertMediumYellow = Color(0xFFFBBF24);
  static const Color alertSevereRed = Color(0xFFEF4444);
  static Color alertLowBlueBg = const Color(0xFF3B82F6).withValues(alpha: 0.1);
  static Color alertMediumYellowBg = const Color(
    0xFFFBBF24,
  ).withValues(alpha: 0.1);
  static Color alertSevereRedBg = const Color(
    0xFFEF4444,
  ).withValues(alpha: 0.1);

  // ─── Indicator Colors ──────────────────────────────
  static const Color liveIndicatorGreen = Color(0xFF10B981);
}
