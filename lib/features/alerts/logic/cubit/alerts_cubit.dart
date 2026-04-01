import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../states/alerts_state.dart';
part 'alerts_cubit.freezed.dart';

/// AlertsCubit مسؤول فقط عن حالة الـ UI المحلية:
/// - tab index (Alerts / Notifications / Audit Logs)
/// - severity filter
///
/// كل البيانات الحقيقية (notifications) تأتي من NotificationsCubit.
class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit() : super(const AlertsState.initial());

  int _tabIndex = 0;
  String _selectedSeverity = 'All Severities';

  int get tabIndex => _tabIndex;
  String get selectedSeverity => _selectedSeverity;

  void init() {
    _emitSuccess();
  }

  void switchTab(int index) {
    _tabIndex = index;
    _emitSuccess();
  }

  void updateSeverity(String severity) {
    _selectedSeverity = severity;
    _emitSuccess();
  }

  void _emitSuccess() {
    emit(
      AlertsState.success(
        tabIndex: _tabIndex,
        selectedSeverity: _selectedSeverity,
      ),
    );
  }
}
