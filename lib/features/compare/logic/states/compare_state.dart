part of '../cubit/compare_cubit.dart';

@freezed
class CompareState with _$CompareState {
  const factory CompareState.initial() = CompareInitial;
  const factory CompareState.loading() = CompareLoading;
  const factory CompareState.successGetAvailableOffers({
    required List<CompareAvailableOfferItem> offers,
    required List<int> selectedOfferIds,
    required List<CompareOfferResultModel> comparedResults,
    CompareGeneratedProposalResponse? generatedProposal,
  }) = SuccessGetAvailableOffers;
  const factory CompareState.successCompareOffers({
    required List<CompareAvailableOfferItem> offers,
    required List<int> selectedOfferIds,
    required List<CompareOfferResultModel> comparedResults,
    CompareGeneratedProposalResponse? generatedProposal,
  }) = SuccessCompareOffers;
  const factory CompareState.successGenerateProposal({
    required List<CompareAvailableOfferItem> offers,
    required List<int> selectedOfferIds,
    required List<CompareOfferResultModel> comparedResults,
    required CompareGeneratedProposalResponse proposal,
  }) = SuccessGenerateProposal;
  const factory CompareState.error({required String error}) = CompareError;
}
