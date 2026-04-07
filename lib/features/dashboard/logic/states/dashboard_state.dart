part of '../cubit/dashboard_cubit.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = DashboardInitial;
  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.success({
    required DashboardStatsResponse stats,
    required List<DashboardRecentActivityItem> recentActivity,
  }) = DashboardSuccess;
  const factory DashboardState.error({required String error}) = DashboardError;
}
