import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/my_notifications_response.dart';
import '../models/user_notification_model.dart';

abstract class AlertsRemoteDataSource {
  Future<MyNotificationsResponse> getMyNotifications({
    bool unreadOnly = true,
    int limit = 20,
  });

  Future<UserNotificationModel> markNotificationRead(int userNotificationId);
}

class AlertsRemoteDataSourceImp implements AlertsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  AlertsRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<MyNotificationsResponse> getMyNotifications({
    bool unreadOnly = true,
    int limit = 20,
  }) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.myNotifications,
        queryParams: {
          'unread_only': unreadOnly.toString(),
          'limit': limit.toString(),
        },
        token: _accessToken,
      );
      return MyNotificationsResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<UserNotificationModel> markNotificationRead(
    int userNotificationId,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.myNotifications}$userNotificationId/read/',
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
