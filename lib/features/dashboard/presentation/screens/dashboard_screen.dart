import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../widgets/dashboard_header_widget.dart';
import '../widgets/latest_uploads_widget.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/sidebar_widget.dart';
import '../widgets/stat_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          // ─── Sidebar ──────────────────────────────
          const SidebarWidget(selectedIndex: 0),

          // ─── Main Content ─────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Header ─────────────────────────
                  const DashboardHeaderWidget(),
                  verticalSpace(24),

                  // ─── Stat Cards Row ─────────────────
                  Row(
                    children: [
                      Expanded(
                        child: StatCardWidget(
                          title: AppStrings.activeAlerts,
                          icon: Icons.warning_amber_rounded,
                          iconColor: AppColors.saffronAmber,
                          iconBgColor: AppColors.saffronAmber.withValues(
                            alpha: 0.1,
                          ),
                          value: '12',
                          trendText: '+3',
                          isUp: true,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: StatCardWidget(
                          title: AppStrings.lowStockCount,
                          icon: Icons.inventory_2_outlined,
                          iconColor: AppColors.emerald,
                          iconBgColor: AppColors.emerald.withValues(alpha: 0.1),
                          value: '8',
                          trendText: '-2',
                          isUp: false,
                        ),
                      ),
                      horizontalSpace(16),
                      Expanded(
                        child: StatCardWidget(
                          title: AppStrings.pendingProposals,
                          icon: Icons.assignment_outlined,
                          iconColor: AppColors.skyBlue,
                          iconBgColor: AppColors.skyBlue.withValues(alpha: 0.1),
                          value: '5',
                          trendText: '+1',
                          isUp: true,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(24),

                  // ─── Uploads + Quick Actions Row ────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2, child: const LatestUploadsWidget()),
                      horizontalSpace(16),
                      Expanded(flex: 1, child: const QuickActionsWidget()),
                    ],
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
