import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/user_notification_model.dart';
import '../../logic/cubit/alerts_cubit.dart';
import '../widgets/alerts_header_widget.dart';
import '../widgets/alerts_list_widget.dart';
import '../widgets/alerts_stat_cards_widget.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 6,
      body: BlocConsumer<AlertsCubit, AlertsState>(
        listener: (context, state) {
          state.whenOrNull(
            successMarkNotificationRead:
                (
                  updatedNotification,
                  alerts,
                  unreadCount,
                  tabIndex,
                  selectedSeverity,
                ) {
                  showAppSnackBar(
                    context,
                    AppStrings.notificationMarkedAsRead,
                  );
                },
            error: (error) => showAppSnackBar(context, error),
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            error: (error) => RetryButtonWidget(
              message: error,
              onRetry: () => context.read<AlertsCubit>().loadData(),
            ),
            successGetMyNotifications:
                (alerts, unreadCount, tabIndex, selectedSeverity) =>
                    _buildContent(
                      context,
                      alerts,
                      tabIndex,
                      selectedSeverity,
                    ),
            successMarkNotificationRead:
                (
                  updatedNotification,
                  alerts,
                  unreadCount,
                  tabIndex,
                  selectedSeverity,
                ) => _buildContent(
                  context,
                  alerts,
                  tabIndex,
                  selectedSeverity,
                ),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<UserNotificationModel> alerts,
    int tabIndex,
    String selectedSeverity,
  ) {
    final cubit = context.read<AlertsCubit>();
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AlertsHeaderWidget(),
          verticalSpace(24),

          AlertsStatCardsWidget(
            activeAlerts: cubit.activeCount,
            criticalAlerts: cubit.criticalCount,
            resolvedToday: cubit.resolvedTodayCount,
          ),
          verticalSpace(24),

          // ─── Tabs ──────────────────────────
          Row(
            children: [
              _buildTab(
                AppStrings.alerts,
                0,
                tabIndex,
                () => cubit.switchTab(0),
              ),
              horizontalSpace(4),
              _buildTab(
                AppStrings.auditLogs,
                1,
                tabIndex,
                () => cubit.switchTab(1),
              ),
            ],
          ),
          verticalSpace(16),

          if (tabIndex == 0) ...[
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.gainsboro, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.filterAlerts,
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  verticalSpace(12),
                  Container(
                    height: 40.h,
                    width: 200.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gainsboro),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSeverity,
                        isExpanded: true,
                        dropdownColor: AppColors.white,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 20.sp,
                          color: AppColors.coolGrey,
                        ),
                        style: AppTextStyles.font14BlackRegular.copyWith(
                          color: AppColors.black,
                        ),
                        items: [
                          DropdownMenuItem(
                            value: AlertsCubit.severityAll,
                            child: Text(
                              AppStrings.severityAll,
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                          DropdownMenuItem(
                            value: AlertsCubit.severityCritical,
                            child: Text(
                              AppStrings.severityCritical,
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                          DropdownMenuItem(
                            value: AlertsCubit.severityWarning,
                            child: Text(
                              AppStrings.severityWarning,
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                          DropdownMenuItem(
                            value: AlertsCubit.severityInfo,
                            child: Text(
                              AppStrings.severityInfo,
                              style: AppTextStyles.font14BlackRegular,
                            ),
                          ),
                        ],
                        onChanged: (v) {
                          if (v != null) cubit.updateSeverity(v);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(24),
            AlertsListWidget(alerts: alerts, onResolve: cubit.resolveAlert),
          ],

          if (tabIndex == 1)
            Container(
              padding: EdgeInsets.all(40.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.gainsboro, width: 1),
              ),
              child: Center(
                child: Text(
                  AppStrings.auditLogs,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, int current, VoidCallback onTap) {
    final isSelected = current == index;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.charcoalBlack : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.charcoalBlack : AppColors.gainsboro,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.font14BlackRegular.copyWith(
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
