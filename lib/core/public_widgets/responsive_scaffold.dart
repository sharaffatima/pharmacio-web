import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';
import '../helpers/app_responsive.dart';
import '../../features/dashboard/presentation/widgets/sidebar_widget.dart';

/// A scaffold that automatically swaps the persistent [SidebarWidget]
/// for a [Drawer] when the viewport is smaller than the mobile
/// breakpoint. All authenticated screens should wrap their bodies
/// with this widget instead of building their own [Row] + Sidebar.
class ResponsiveScaffold extends StatelessWidget {
  final int selectedIndex;
  final Widget body;
  final Color? backgroundColor;

  const ResponsiveScaffold({
    super.key,
    required this.selectedIndex,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppColors.offWhiteGrey;

    if (AppResponsive.isMobile(context)) {
      return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.charcoalBlack,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.charcoalBlack,
            size: 22.sp,
          ),
          shape: Border(
            bottom: BorderSide(color: AppColors.gainsboro, width: 1),
          ),
        ),
        drawer: Drawer(
          backgroundColor: AppColors.white,
          child: SafeArea(
            child: SidebarWidget(selectedIndex: selectedIndex),
          ),
        ),
        body: body,
      );
    }

    return Scaffold(
      backgroundColor: bg,
      body: Row(
        children: [
          SidebarWidget(selectedIndex: selectedIndex),
          Expanded(child: body),
        ],
      ),
    );
  }
}
