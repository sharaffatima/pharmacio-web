import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../presentation/widgets/alerts_list_widget.dart';

part '../states/alerts_state.dart';
part 'alerts_cubit.freezed.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final ApiServicesImpl apiServicesImpl;

  AlertsCubit(this.apiServicesImpl) : super(const AlertsState.initial());

  List<AlertItem> _alerts = [];
  int _tabIndex = 0;
  String _selectedSeverity = 'All Severities';

  String? get _token =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken);

  int get tabIndex => _tabIndex;
  String get selectedSeverity => _selectedSeverity;

  Future<void> loadData() async {
    emit(const AlertsState.loading());

    try {
      final response = await apiServicesImpl.get(
        AppLinkUrl.notificationsMe,
        token: _token,
      );

      final List data = response is List ? response : (response['results'] ?? []);

      _alerts = data.map((e) {
        return AlertItem(
          id: e['id'] ?? 0,
          title: e['title']?.toString() ?? '',
          description: e['message']?.toString() ?? '',
          severity: _mapSeverity(e['severity']?.toString() ?? 'info'),
          isResolved: e['is_read'] ?? false,
        );
      }).toList();

      _emitSuccess();
    } catch (e) {
      emit(const AlertsState.error(error: "Failed to load notifications"));
    }
  }

  void switchTab(int index) {
    _tabIndex = index;
    _emitSuccess();
  }

  void updateSeverity(String severity) {
    _selectedSeverity = severity;
    _emitSuccess();
  }

  Future<void> resolveAlert(int filteredIndex) async {
    try {
      final filtered = _getFiltered();
      final alert = filtered[filteredIndex];

      await apiServicesImpl.post(
        "${AppLinkUrl.notificationsBase}/${alert.id}/read/",
        token: _token,
      );

      final realIndex = _alerts.indexOf(alert);
      _alerts[realIndex] = _alerts[realIndex].copyWith(isResolved: true);
      _emitSuccess();
    } catch (e) {
      emit(const AlertsState.error(error: "Failed to mark as read"));
    }
  }

  int get activeCount => _alerts.where((a) => !a.isResolved).length;
  int get criticalCount =>
      _alerts.where((a) => a.severity == 'Critical' && !a.isResolved).length;
  int get resolvedTodayCount => _alerts.where((a) => a.isResolved).length;

  List<AlertItem> _getFiltered() {
    if (_selectedSeverity == 'All Severities') return List.from(_alerts);
    return _alerts.where((a) => a.severity == _selectedSeverity).toList();
  }

  void _emitSuccess() {
    emit(
      AlertsState.success(
        alerts: _getFiltered(),
        tabIndex: _tabIndex,
        selectedSeverity: _selectedSeverity,
      ),
    );
  }

  String _mapSeverity(String s) {
    switch (s.toLowerCase()) {
      case 'critical':
        return 'Critical';
      case 'warning':
        return 'Warning';
      default:
        return 'Info';
    }
  }
}