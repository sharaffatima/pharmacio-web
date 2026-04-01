import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/notification_model.dart';
import '../models/notifications_response.dart';

abstract class NotificationsRemoteDataSource {
  Future<NotificationsResponse> getMyNotifications({
    bool unreadOnly = false,
    int limit = 20,
  });
  Future<UserNotificationModel> markAsRead(int id);
}

class NotificationsRemoteDataSourceImp
    implements NotificationsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  NotificationsRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<NotificationsResponse> getMyNotifications({
    bool unreadOnly = false,
    int limit = 20,
  }) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.notificationsMe,
        queryParams: {
          if (unreadOnly) 'unread_only': 'true',
          'limit': limit.toString(),
        },
        token: _accessToken,
      );
      return NotificationsResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<UserNotificationModel> markAsRead(int id) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.notificationRead(id),
        token: _accessToken,
      );
      return UserNotificationModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
