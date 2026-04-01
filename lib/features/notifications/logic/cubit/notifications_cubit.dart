import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/notification_model.dart';
import '../../data/models/notifications_response.dart';
import '../../data/repos/notifications_repo.dart';

part '../states/notifications_state.dart';
part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;

  NotificationsCubit(this._notificationsRepo)
      : super(const NotificationsState.initial());

  // ─── Load ─────────────────────────────────────────────────────────────────
  Future<void> loadNotifications({
    bool unreadOnly = false,
    int limit = 20,
  }) async {
    emit(const NotificationsState.loading());
    try {
      final response = await _notificationsRepo.getMyNotifications(
        unreadOnly: unreadOnly,
        limit: limit,
      );
      emit(NotificationsState.success(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(NotificationsState.error(error: message));
    }
  }

  // ─── Mark as Read ─────────────────────────────────────────────────────────
  Future<void> markAsRead(int id) async {
    try {
      final notification = await _notificationsRepo.markAsRead(id);
      emit(NotificationsState.markReadSuccess(notification));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(NotificationsState.error(error: message));
    }
  }
}
