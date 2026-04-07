import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/user_notification_model.dart';
import '../../data/repos/alerts_repo.dart';

part '../states/alerts_state.dart';
part 'alerts_cubit.freezed.dart';

class AlertsCubit extends Cubit<AlertsState> {
  final AlertsRepo _alertsRepo;

  AlertsCubit(this._alertsRepo) : super(const AlertsState.initial());

  List<UserNotificationModel> _alerts = [];
  int _unreadCount = 0;
  int _tabIndex = 0;
  String _selectedSeverity = 'All Severities';

  int get tabIndex => _tabIndex;
  String get selectedSeverity => _selectedSeverity;
  int get unreadCount => _unreadCount;

  Future<void> loadData() async {
    emit(const AlertsState.loading());

    try {
      final response = await _alertsRepo.getMyNotifications(
        unreadOnly: false,
        limit: 20,
      );
      _alerts = response.results;
      _unreadCount = response.unreadCount;
      _emitSuccess();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AlertsState.error(error: message));
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
    final filtered = _getFiltered();

    if (filteredIndex < 0 || filteredIndex >= filtered.length) return;

    final alert = filtered[filteredIndex];

    if (alert.isRead) return;

    emit(const AlertsState.loading());

    try {
      final updatedNotification = await _alertsRepo.markNotificationRead(alert.id);
      final realIndex = _alerts.indexWhere((item) => item.id == alert.id);

      if (realIndex != -1) {
        _alerts[realIndex] = updatedNotification;
      }

      _unreadCount = _alerts.where((a) => !a.isRead).length;
      _emitSuccess(updatedNotification: updatedNotification);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(AlertsState.error(error: message));
    }
  }

  int get activeCount => _alerts.where((a) => !a.isRead).length;
  int get criticalCount =>
      _alerts
          .where((a) => _severityFromType(a.type) == 'Critical' && !a.isRead)
          .length;
  int get resolvedTodayCount =>
      _alerts.where((a) => a.isRead && _isToday(a.readAt)).length;

  List<UserNotificationModel> _getFiltered() {
    if (_selectedSeverity == 'All Severities') return List.from(_alerts);
    return _alerts
        .where((a) => _severityFromType(a.type) == _selectedSeverity)
        .toList();
  }

  void _emitSuccess({UserNotificationModel? updatedNotification}) {
    final filtered = _getFiltered();

    if (updatedNotification != null) {
      emit(
        AlertsState.successMarkNotificationRead(
          updatedNotification: updatedNotification,
          alerts: filtered,
          unreadCount: _unreadCount,
          tabIndex: _tabIndex,
          selectedSeverity: _selectedSeverity,
        ),
      );
      return;
    }

    emit(
      AlertsState.successGetMyNotifications(
        alerts: filtered,
        unreadCount: _unreadCount,
        tabIndex: _tabIndex,
        selectedSeverity: _selectedSeverity,
      ),
    );
  }

  String _severityFromType(String type) {
    final value = type.toLowerCase();
    if (value.contains('low_stock')) return 'Critical';
    if (value.contains('warning')) return 'Warning';
    return 'Info';
  }

  bool _isToday(DateTime? dateTime) {
    if (dateTime == null) return false;
    final now = DateTime.now();
    return dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;
  }
}
