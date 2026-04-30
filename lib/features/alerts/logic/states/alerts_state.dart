part of '../cubit/alerts_cubit.dart';

@freezed
class AlertsState with _$AlertsState {
  const factory AlertsState.initial() = AlertsInitial;
  const factory AlertsState.loading() = AlertsLoading;
  const factory AlertsState.successGetMyNotifications({
    required List<UserNotificationModel> alerts,
    required int unreadCount,
    required int tabIndex,
    required String selectedSeverity,
  }) = SuccessGetMyNotifications;
  const factory AlertsState.successMarkNotificationRead({
    required UserNotificationModel updatedNotification,
    required List<UserNotificationModel> alerts,
    required int unreadCount,
    required int tabIndex,
    required String selectedSeverity,
  }) = SuccessMarkNotificationRead;
  const factory AlertsState.error({required String error}) = AlertsError;
}
