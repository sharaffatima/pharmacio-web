import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/notifications_remote_data_source.dart';
import '../models/notification_model.dart';
import '../models/notifications_response.dart';

class NotificationsRepo {
  final NotificationsRemoteDataSource notificationsRemoteDataSource;
  final NetworkInfo networkInfo;

  NotificationsRepo({
    required this.notificationsRemoteDataSource,
    required this.networkInfo,
  });

  Future<NotificationsResponse> getMyNotifications({
    bool unreadOnly = false,
    int limit = 20,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await notificationsRemoteDataSource.getMyNotifications(
          unreadOnly: unreadOnly,
          limit: limit,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<UserNotificationModel> markAsRead(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await notificationsRemoteDataSource.markAsRead(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
