import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/dashboard_recent_activity_item.dart';
import '../models/dashboard_stats_response.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardStatsResponse> getDashboardStats();

  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity();
}

class DashboardRemoteDataSourceImp implements DashboardRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  DashboardRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<DashboardStatsResponse> getDashboardStats() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.dashboardStats,
        token: _accessToken,
      );
      return DashboardStatsResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.dashboardRecentActivity,
        token: _accessToken,
      );
      return (request as List<dynamic>)
          .map(
            (item) => DashboardRecentActivityItem.fromJson(
              item as Map<String, dynamic>,
            ),
          )
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
