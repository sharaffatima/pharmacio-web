import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../data/models/dashboard_recent_activity_item.dart';
import '../../data/models/dashboard_stats_response.dart';
import '../../logic/cubit/dashboard_cubit.dart';
import '../widgets/dashboard_header_widget.dart';
import '../widgets/dashboard_stat_chart_card.dart';
import '../widgets/latest_uploads_widget.dart';
import '../widgets/quick_actions_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 0,
      title: AppStrings.dashboard,
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            error: (error) => RetryButtonWidget(
              message: error,
              onRetry: () => context.read<DashboardCubit>().loadData(),
            ),
            success: (stats, recentActivity) =>
                _buildContent(context, stats, recentActivity),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    DashboardStatsResponse stats,
    List<DashboardRecentActivityItem> recentActivity,
  ) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    final statValues = [
      stats.activityAlerts ?? 0,
      stats.lowStock ?? 0,
      stats.proposals ?? 0,
      stats.inventory ?? 0,
    ];
    final maxValue = statValues.reduce(max).clamp(1, double.maxFinite).toInt();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 32.w,
        vertical: isMobile ? 20.h : 28.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardHeaderWidget(),
          verticalSpace(24),

          if (isMobile)
            Column(
              children: [
                DashboardStatChartCard(
                  title: AppStrings.activeAlerts,
                  icon: Icons.warning_amber_rounded,
                  iconColor: AppColors.saffronAmber,
                  iconBgColor: AppColors.saffronAmber.withValues(alpha: 0.12),
                  value: stats.activityAlerts ?? 0,
                  maxValue: maxValue,
                  series: _buildSeries(stats.activityAlerts ?? 0),
                ),
                verticalSpace(12),
                DashboardStatChartCard(
                  title: AppStrings.lowStockCount,
                  icon: Icons.inventory_2_outlined,
                  iconColor: AppColors.emerald,
                  iconBgColor: AppColors.emerald.withValues(alpha: 0.12),
                  value: stats.lowStock ?? 0,
                  maxValue: maxValue,
                  series: _buildSeries(stats.lowStock ?? 0),
                ),
                verticalSpace(12),
                DashboardStatChartCard(
                  title: AppStrings.pendingProposals,
                  icon: Icons.assignment_outlined,
                  iconColor: AppColors.skyBlue,
                  iconBgColor: AppColors.skyBlue.withValues(alpha: 0.12),
                  value: stats.proposals ?? 0,
                  maxValue: maxValue,
                  series: _buildSeries(stats.proposals ?? 0),
                ),
                verticalSpace(12),
                DashboardStatChartCard(
                  title: AppStrings.inventory,
                  icon: Icons.inventory,
                  iconColor: AppColors.charcoalBlack,
                  iconBgColor: AppColors.charcoalBlack.withValues(alpha: 0.1),
                  value: stats.inventory ?? 0,
                  maxValue: maxValue,
                  series: _buildSeries(stats.inventory ?? 0),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: DashboardStatChartCard(
                    title: AppStrings.activeAlerts,
                    icon: Icons.warning_amber_rounded,
                    iconColor: AppColors.saffronAmber,
                    iconBgColor: AppColors.saffronAmber.withValues(alpha: 0.12),
                    value: stats.activityAlerts ?? 0,
                    maxValue: maxValue,
                    series: _buildSeries(stats.activityAlerts ?? 0),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: DashboardStatChartCard(
                    title: AppStrings.lowStockCount,
                    icon: Icons.inventory_2_outlined,
                    iconColor: AppColors.emerald,
                    iconBgColor: AppColors.emerald.withValues(alpha: 0.12),
                    value: stats.lowStock ?? 0,
                    maxValue: maxValue,
                    series: _buildSeries(stats.lowStock ?? 0),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: DashboardStatChartCard(
                    title: AppStrings.pendingProposals,
                    icon: Icons.assignment_outlined,
                    iconColor: AppColors.skyBlue,
                    iconBgColor: AppColors.skyBlue.withValues(alpha: 0.12),
                    value: stats.proposals ?? 0,
                    maxValue: maxValue,
                    series: _buildSeries(stats.proposals ?? 0),
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: DashboardStatChartCard(
                    title: AppStrings.inventory,
                    icon: Icons.inventory,
                    iconColor: AppColors.charcoalBlack,
                    iconBgColor: AppColors.charcoalBlack.withValues(alpha: 0.1),
                    value: stats.inventory ?? 0,
                    maxValue: maxValue,
                    series: _buildSeries(stats.inventory ?? 0),
                  ),
                ),
              ],
            ),
          verticalSpace(24),

          if (isMobile)
            Column(
              children: [
                LatestUploadsWidget(activities: recentActivity),
                verticalSpace(16),
                const QuickActionsWidget(),
              ],
            )
          else
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

List<double> _buildSeries(int value) {
  if (value <= 0) {
    return List<double>.filled(7, 0);
  }

  final base = value.toDouble();
  return List<double>.generate(7, (index) {
    final wave = sin(index * 0.9) * 0.18;
    final drift = (index - 3) * 0.04;
    final multiplier = (0.75 + wave + drift).clamp(0.35, 1.35);
    return (base * multiplier).clamp(0, base * 1.6);
  });
}
