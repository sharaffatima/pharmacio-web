part of '../cubit/proposals_cubit.dart';

@freezed
class ProposalsState with _$ProposalsState {
  const factory ProposalsState.initial() = ProposalsInitial;
  const factory ProposalsState.loading() = ProposalsLoading;
  const factory ProposalsState.successGetProposalsList(
    List<PurchaseProposalModel> proposals,
  ) = SuccessGetProposalsList;
  const factory ProposalsState.successGetProposalDetail({
    required PurchaseProposalModel proposal,
    required List<PurchaseProposalModel> proposals,
  }) = SuccessGetProposalDetail;
  const factory ProposalsState.successGetProposalStatus({
    required ProposalStatusResponse status,
    required List<PurchaseProposalModel> proposals,
  }) = SuccessGetProposalStatus;
  const factory ProposalsState.successApproveProposal({
    required PurchaseProposalModel proposal,
    required List<PurchaseProposalModel> proposals,
  }) = SuccessApproveProposal;
  const factory ProposalsState.successRejectProposal({
    required PurchaseProposalModel proposal,
    required List<PurchaseProposalModel> proposals,
  }) = SuccessRejectProposal;
  const factory ProposalsState.error({required String error}) = ProposalsError;
}
