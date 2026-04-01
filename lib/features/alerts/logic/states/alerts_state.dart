part of '../cubit/alerts_cubit.dart';

@freezed
class AlertsState with _$AlertsState {
  const factory AlertsState.initial() = AlertsInitial;
  const factory AlertsState.success({
    required int tabIndex,
    required String selectedSeverity,
  }) = AlertsSuccess;
}
