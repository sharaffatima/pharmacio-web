import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../models/dashboard_recent_activity_item.dart';
import '../models/dashboard_stats_response.dart';

class DashboardRepo {
  final DashboardRemoteDataSource dashboardRemoteDataSource;
  final NetworkInfo networkInfo;

  DashboardRepo({
    required this.dashboardRemoteDataSource,
    required this.networkInfo,
  });

  Future<DashboardStatsResponse> getDashboardStats() async {
    if (await networkInfo.isConnected) {
      try {
        return await dashboardRemoteDataSource.getDashboardStats();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<DashboardRecentActivityItem>> getDashboardRecentActivity() async {
    if (await networkInfo.isConnected) {
      try {
        return await dashboardRemoteDataSource.getDashboardRecentActivity();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
