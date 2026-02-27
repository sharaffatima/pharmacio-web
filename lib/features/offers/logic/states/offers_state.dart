part of '../cubit/offers_cubit.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.initial() = OffersInitial;
  const factory OffersState.loading() = OffersLoading;
  const factory OffersState.success(List<OfferEntry> offers) = OffersSuccess;
  const factory OffersState.error({required String error}) = OffersError;
}
