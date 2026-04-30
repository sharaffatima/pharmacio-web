import 'package:flutter/material.dart';

/// Centralised breakpoints + helpers for adapting layouts between
/// mobile, tablet, and desktop viewports.
class AppResponsive {
  /// Below this width we collapse the persistent sidebar into a Drawer.
  static const double mobileBreakpoint = 768;

  /// Below this width we tighten content padding and stack two-column rows.
  static const double tabletBreakpoint = 1024;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w >= mobileBreakpoint && w < tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;
}
