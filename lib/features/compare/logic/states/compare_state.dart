part of '../cubit/compare_cubit.dart';

@freezed
class CompareState with _$CompareState {
  const factory CompareState.initial() = CompareInitial;
  const factory CompareState.loading() = CompareLoading;
  const factory CompareState.success(List<CompareOfferItem> offers) =
      CompareSuccess;
  const factory CompareState.error({required String error}) = CompareError;
}
