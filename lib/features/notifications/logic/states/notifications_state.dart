part of '../cubit/notifications_cubit.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = NotificationsInitial;
  const factory NotificationsState.loading() = NotificationsLoading;
  const factory NotificationsState.success(
    NotificationsResponse response,
  ) = NotificationsSuccess;
  const factory NotificationsState.markReadSuccess(
    UserNotificationModel notification,
  ) = NotificationsMarkReadSuccess;
  const factory NotificationsState.error({required String error}) =
      NotificationsError;
}
