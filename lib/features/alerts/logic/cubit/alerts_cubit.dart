import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/widgets/alerts_list_widget.dart';

part '../states/alerts_state.dart';
part 'alerts_cubit.freezed.dart';

class AlertsCubit extends Cubit<AlertsState> {
  AlertsCubit() : super(const AlertsState.initial());

  List<AlertItem> _alerts = [];
  int _tabIndex = 0;
  String _selectedSeverity = 'All Severities';

  int get tabIndex => _tabIndex;
  String get selectedSeverity => _selectedSeverity;

  void loadData() {
    emit(const AlertsState.loading());
    _alerts = AlertItem.sampleData();
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

  void resolveAlert(int filteredIndex) {
    final filtered = _getFiltered();
    final alert = filtered[filteredIndex];
    final realIndex = _alerts.indexOf(alert);

    _alerts[realIndex] = _alerts[realIndex].copyWith(isResolved: true);
    _emitSuccess();
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
}
