part of '../cubit/alerts_cubit.dart';

@freezed
class AlertsState with _$AlertsState {
  const factory AlertsState.initial() = AlertsInitial;
  const factory AlertsState.loading() = AlertsLoading;
  const factory AlertsState.success({
    required List<AlertItem> alerts,
    required int tabIndex,
    required String selectedSeverity,
  }) = AlertsSuccess;
  const factory AlertsState.error({required String error}) = AlertsError;
}
