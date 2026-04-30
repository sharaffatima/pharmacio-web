import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/alerts_remote_data_source.dart';
import '../models/my_notifications_response.dart';
import '../models/user_notification_model.dart';

class AlertsRepo {
  final AlertsRemoteDataSource alertsRemoteDataSource;
  final NetworkInfo networkInfo;

  AlertsRepo({required this.alertsRemoteDataSource, required this.networkInfo});

  Future<MyNotificationsResponse> getMyNotifications({
    bool unreadOnly = true,
    int limit = 20,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await alertsRemoteDataSource.getMyNotifications(
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

  Future<UserNotificationModel> markNotificationRead(
    int userNotificationId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await alertsRemoteDataSource.markNotificationRead(
          userNotificationId,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
