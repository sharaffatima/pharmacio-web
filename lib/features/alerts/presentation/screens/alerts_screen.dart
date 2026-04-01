import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../../notifications/data/models/notification_model.dart';
import '../../../notifications/data/models/notifications_response.dart';
import '../../../notifications/logic/cubit/notifications_cubit.dart';
import '../../logic/cubit/alerts_cubit.dart';
import '../widgets/alerts_header_widget.dart';
import '../widgets/alerts_stat_cards_widget.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  static const _severities = [
    'All Severities',
    'low_stock',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 6),
          Expanded(
            child: BlocBuilder<AlertsCubit, AlertsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (tabIndex, selectedSeverity) => _buildContent(
                    context,
                    tabIndex,
                    selectedSeverity,
                  ),
                  orElse: () => const LoadingWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    int tabIndex,
    String selectedSeverity,
  ) {
    final alertsCubit = context.read<AlertsCubit>();

    return BlocConsumer<NotificationsCubit, NotificationsState>(
      listener: (context, state) {
        state.whenOrNull(
          markReadSuccess: (_) {
            // Reload after marking read so counts update
            context.read<NotificationsCubit>().loadNotifications();
          },
        );
      },
      builder: (context, notifState) {
        // Extract data from notifications state
        final response = notifState.whenOrNull(
          success: (r) => r,
          markReadSuccess: (_) => null,
        );

        // Compute stat values from real API data
        final unreadCount = response?.unreadCount ?? 0;
        final totalCount = response?.count ?? 0;
        final lowStockCount = response?.results
                .where((n) => n.type == 'low_stock' && !n.isRead)
                .length ??
            0;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AlertsHeaderWidget(),
              verticalSpace(24),

              // ─── Stat Cards (real data from NotificationsCubit) ──────────
              AlertsStatCardsWidget(
                activeAlerts: unreadCount,
                criticalAlerts: lowStockCount,
                resolvedToday: totalCount - unreadCount,
              ),
              verticalSpace(24),

              // ─── Tabs ────────────────────────────────────────────────────
              Row(
                children: [
                  _buildTab(
                    AppStrings.alerts,
                    0,
                    tabIndex,
                    () => alertsCubit.switchTab(0),
                  ),
                  horizontalSpace(4),
                  _buildTab(
                    AppStrings.notifications,
                    1,
                    tabIndex,
                    () => alertsCubit.switchTab(1),
                  ),
                  horizontalSpace(4),
                  _buildTab(
                    AppStrings.auditLogs,
                    2,
                    tabIndex,
                    () => alertsCubit.switchTab(2),
                  ),
                ],
              ),
              verticalSpace(16),

              // ─── Tab 0: Alerts (unread notifications only) ───────────────
              if (tabIndex == 0)
                _buildAlertsTab(
                  context,
                  response,
                  selectedSeverity,
                  alertsCubit,
                ),

              // ─── Tab 1: All Notifications ─────────────────────────────────
              if (tabIndex == 1)
                _buildNotificationsTab(context, response),

              // ─── Tab 2: Audit Logs (placeholder) ─────────────────────────
              if (tabIndex == 2)
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
      },
    );
  }

  // ─── Tab 0: unread alerts with type filter ────────────────────────────────
  Widget _buildAlertsTab(
    BuildContext context,
    NotificationsResponse? response,
    String selectedSeverity,
    AlertsCubit alertsCubit,
  ) {
    if (response == null) return const LoadingWidget();

    // Filter: show only unread, optionally by type
    List<UserNotificationModel> filtered = response.results
        .where((n) => !n.isRead)
        .toList();

    if (selectedSeverity != 'All Severities') {
      filtered = filtered.where((n) => n.type == selectedSeverity).toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Filter bar
        Container(
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.gainsboro, width: 1),
          ),
          child: Row(
            children: [
              Text(
                AppStrings.filterAlerts,
                style: AppTextStyles.font16BlackSemiBold,
              ),
              horizontalSpace(16),
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
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20.sp,
                      color: AppColors.coolGrey,
                    ),
                    style: AppTextStyles.font14BlackRegular,
                    items: _severities
                        .map(
                          (s) => DropdownMenuItem(value: s, child: Text(s)),
                        )
                        .toList(),
                    onChanged: (v) {
                      if (v != null) alertsCubit.updateSeverity(v);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(24),

        // Alerts list (unread notifications)
        Container(
          padding: EdgeInsets.all(24.r),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.gainsboro, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${AppStrings.alerts} (${filtered.length})',
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  if (filtered.isNotEmpty)
                    TextButton.icon(
                      onPressed: () {
                        // Mark all visible as read
                        final notifCubit =
                            context.read<NotificationsCubit>();
                        for (final n in filtered) {
                          notifCubit.markAsRead(n.id);
                        }
                      },
                      icon: Icon(
                        Icons.done_all,
                        size: 16.sp,
                        color: AppColors.skyBlue,
                      ),
                      label: Text(
                        AppStrings.markAsRead,
                        style: AppTextStyles.font14BlackRegular.copyWith(
                          color: AppColors.skyBlue,
                        ),
                      ),
                    ),
                ],
              ),
              verticalSpace(16),

              if (filtered.isEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32.h),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          size: 48.sp,
                          color: AppColors.emerald,
                        ),
                        verticalSpace(12),
                        Text(
                          'No active alerts',
                          style: AppTextStyles.font16BlackSemiBold.copyWith(
                            color: AppColors.emerald,
                          ),
                        ),
                        verticalSpace(4),
                        Text(
                          'All caught up!',
                          style: AppTextStyles.font13GreyRegular,
                        ),
                      ],
                    ),
                  ),
                )
              else
                ...filtered.map(
                  (notif) => _buildAlertRow(context, notif),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ─── Single alert row ─────────────────────────────────────────────────────
  Widget _buildAlertRow(BuildContext context, UserNotificationModel notif) {
    // Map notification type to severity visuals
    final isLowStock = notif.type == 'low_stock';
    final color = isLowStock ? AppColors.brightRed : AppColors.saffronAmber;
    final bgColor = color.withValues(alpha: 0.08);
    final icon = isLowStock ? Icons.inventory_2_outlined : Icons.warning_amber;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon badge
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 20.sp, color: color),
          ),
          horizontalSpace(12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Type chip
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        notif.type.replaceAll('_', ' ').toUpperCase(),
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          color: color,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      notif.createdAt.length >= 10
                          ? notif.createdAt.substring(0, 10)
                          : notif.createdAt,
                      style: AppTextStyles.font12GreyRegular,
                    ),
                  ],
                ),
                verticalSpace(6),
                Text(
                  notif.message,
                  style: AppTextStyles.font13BlackMedium,
                ),
              ],
            ),
          ),
          horizontalSpace(12),

          // Mark as read button
          InkWell(
            onTap: () => context.read<NotificationsCubit>().markAsRead(notif.id),
            borderRadius: BorderRadius.circular(4.r),
            child: Tooltip(
              message: AppStrings.markAsRead,
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: Icon(
                  Icons.check_circle_outline,
                  size: 20.sp,
                  color: AppColors.emerald,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Tab 1: All notifications ─────────────────────────────────────────────
  Widget _buildNotificationsTab(
    BuildContext context,
    NotificationsResponse? response,
  ) {
    if (response == null) return const LoadingWidget();

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${AppStrings.notifications} (${response.count})',
                style: AppTextStyles.font16BlackSemiBold,
              ),
              if (response.unreadCount > 0)
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.skyBlue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${response.unreadCount} unread',
                    style: AppTextStyles.font12GreyRegular.copyWith(
                      color: AppColors.skyBlue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          verticalSpace(16),

          if (response.results.isEmpty)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40.h),
                child: Text(
                  AppStrings.noNotifications,
                  style: AppTextStyles.font14CoolGreyRegular,
                ),
              ),
            )
          else
            ...response.results.map(
              (notif) => _buildNotificationRow(context, notif),
            ),
        ],
      ),
    );
  }

  // ─── Single notification row ──────────────────────────────────────────────
  Widget _buildNotificationRow(
    BuildContext context,
    UserNotificationModel notif,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: notif.isRead
            ? AppColors.white
            : AppColors.skyBlue.withValues(alpha: 0.03),
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unread dot
          Container(
            margin: EdgeInsets.only(top: 6.h, right: 12.w),
            width: 8.w,
            height: 8.h,
            decoration: BoxDecoration(
              color: notif.isRead ? Colors.transparent : AppColors.skyBlue,
              shape: BoxShape.circle,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.saffronAmber.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        notif.type,
                        style: AppTextStyles.font12GreyRegular.copyWith(
                          color: AppColors.saffronAmber,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      notif.createdAt.length >= 10
                          ? notif.createdAt.substring(0, 10)
                          : notif.createdAt,
                      style: AppTextStyles.font12GreyRegular,
                    ),
                  ],
                ),
                verticalSpace(6),
                Text(
                  notif.message,
                  style: AppTextStyles.font13BlackMedium.copyWith(
                    fontWeight:
                        notif.isRead ? FontWeight.w400 : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          if (!notif.isRead)
            InkWell(
              onTap: () =>
                  context.read<NotificationsCubit>().markAsRead(notif.id),
              borderRadius: BorderRadius.circular(4.r),
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: Icon(
                  Icons.done,
                  size: 18.sp,
                  color: AppColors.skyBlue,
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
            color:
                isSelected ? AppColors.charcoalBlack : AppColors.gainsboro,
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
