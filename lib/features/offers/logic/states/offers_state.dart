part of '../cubit/offers_cubit.dart';

@freezed
class OffersState with _$OffersState {
  const factory OffersState.initial() = OffersInitial;
  const factory OffersState.loading() = OffersLoading;
  const factory OffersState.successGetAvailableOffers(
    List<AvailableOfferItem> offers,
  ) = SuccessGetAvailableOffers;
  const factory OffersState.error({required String error}) = OffersError;
}
