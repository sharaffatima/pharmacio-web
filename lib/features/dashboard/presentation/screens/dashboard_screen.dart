import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../data/models/dashboard_recent_activity_item.dart';
import '../../data/models/dashboard_stats_response.dart';
import '../../logic/cubit/dashboard_cubit.dart';
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
          const SidebarWidget(selectedIndex: 0),
          Expanded(
            child: BlocBuilder<DashboardCubit, DashboardState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (stats, recentActivity) =>
                      _buildContent(stats, recentActivity),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    DashboardStatsResponse stats,
    List<DashboardRecentActivityItem> recentActivity,
  ) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardHeaderWidget(),
          verticalSpace(24),

          Row(
            children: [
              Expanded(
                child: StatCardWidget(
                  title: AppStrings.activeAlerts,
                  icon: Icons.warning_amber_rounded,
                  iconColor: AppColors.saffronAmber,
                  iconBgColor: AppColors.saffronAmber.withValues(alpha: 0.1),
                  value: '${stats.activityAlerts}',
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: StatCardWidget(
                  title: AppStrings.lowStockCount,
                  icon: Icons.inventory_2_outlined,
                  iconColor: AppColors.emerald,
                  iconBgColor: AppColors.emerald.withValues(alpha: 0.1),
                  value: '${stats.lowStock}',
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: StatCardWidget(
                  title: AppStrings.pendingProposals,
                  icon: Icons.assignment_outlined,
                  iconColor: AppColors.skyBlue,
                  iconBgColor: AppColors.skyBlue.withValues(alpha: 0.1),
                  value: '${stats.proposals}',
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: StatCardWidget(
                  title: AppStrings.inventory,
                  icon: Icons.inventory,
                  iconColor: AppColors.charcoalBlack,
                  iconBgColor: AppColors.charcoalBlack.withValues(alpha: 0.08),
                  value: '${stats.inventory}',
                ),
              ),
            ],
          ),
          verticalSpace(24),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: LatestUploadsWidget(activities: recentActivity),
              ),
              horizontalSpace(16),
              const Expanded(flex: 1, child: QuickActionsWidget()),
            ],
          ),
        ],
      ),
    );
  }
}
