import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/dashboard_recent_activity_item.dart';
import '../../data/models/dashboard_stats_response.dart';
import '../../data/repos/dashboard_repo.dart';

part '../states/dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo _dashboardRepo;

  DashboardCubit(this._dashboardRepo) : super(const DashboardState.initial());

  Future<void> loadData() async {
    emit(const DashboardState.loading());

    try {
      final results = await Future.wait<dynamic>([
        _dashboardRepo.getDashboardStats(),
        _dashboardRepo.getDashboardRecentActivity(),
      ]);

      emit(
        DashboardState.success(
          stats: results[0] as DashboardStatsResponse,
          recentActivity: results[1] as List<DashboardRecentActivityItem>,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(DashboardState.error(error: message));
    }
  }
}
