import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../data/models/dashboard_recent_activity_item.dart';
import '../../data/models/dashboard_stats_response.dart';
import '../../logic/cubit/dashboard_cubit.dart';
import '../widgets/dashboard_header_widget.dart';
import '../widgets/latest_uploads_widget.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/stat_card_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 0,
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
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;

    final statCards = [
      StatCardWidget(
        title: AppStrings.activeAlerts,
        icon: Icons.warning_amber_rounded,
        iconColor: AppColors.saffronAmber,
        iconBgColor: AppColors.saffronAmber.withValues(alpha: 0.1),
        value: '${stats.activityAlerts}',
      ),
      StatCardWidget(
        title: AppStrings.lowStockCount,
        icon: Icons.inventory_2_outlined,
        iconColor: AppColors.emerald,
        iconBgColor: AppColors.emerald.withValues(alpha: 0.1),
        value: '${stats.lowStock}',
      ),
      StatCardWidget(
        title: AppStrings.pendingProposals,
        icon: Icons.assignment_outlined,
        iconColor: AppColors.skyBlue,
        iconBgColor: AppColors.skyBlue.withValues(alpha: 0.1),
        value: '${stats.proposals}',
      ),
      StatCardWidget(
        title: AppStrings.inventory,
        icon: Icons.inventory,
        iconColor: AppColors.charcoalBlack,
        iconBgColor: AppColors.charcoalBlack.withValues(alpha: 0.08),
        value: '${stats.inventory}',
      ),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardHeaderWidget(),
          verticalSpace(24),

          // ─── Stat Cards: row on desktop, 2x2 grid on mobile ─
          if (isMobile)
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: statCards
                  .map(
                    (c) => SizedBox(
                      width: (MediaQuery.of(context).size.width - hPad * 2 - 12.w) / 2,
                      child: c,
                    ),
                  )
                  .toList(),
            )
          else
            Row(
              children: [
                for (var i = 0; i < statCards.length; i++) ...[
                  Expanded(child: statCards[i]),
                  if (i < statCards.length - 1) horizontalSpace(16),
                ],
              ],
            ),
          verticalSpace(24),

          // ─── Latest Uploads + Quick Actions ─────────────────
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
