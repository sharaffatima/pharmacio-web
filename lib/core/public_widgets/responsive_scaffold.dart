import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/widgets/sidebar_widget.dart';
import '../constants/colors.dart';

class ResponsiveScaffold extends StatelessWidget {
  final int selectedIndex;
  final Widget body;
  final String? title;
  final Color? backgroundColor;

  const ResponsiveScaffold({
    super.key,
    required this.selectedIndex,
    required this.body,
    this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        if (isMobile) {
          return Scaffold(
            backgroundColor: backgroundColor ?? AppColors.offWhiteGrey,
            appBar: AppBar(
              title: Text(title ?? ''),
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.charcoalBlack,
              elevation: 0,
            ),
            drawer: Drawer(
              child: SafeArea(
                child: SidebarWidget(selectedIndex: selectedIndex),
              ),
            ),
            body: body,
          );
        }

        return Scaffold(
          backgroundColor: backgroundColor ?? AppColors.offWhiteGrey,
          body: Row(
            children: [
              SidebarWidget(selectedIndex: selectedIndex),
              Expanded(child: body),
            ],
          ),
        );
      },
    );
  }
}
