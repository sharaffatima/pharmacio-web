part of '../cubit/proposals_cubit.dart';

@freezed
class ProposalsState with _$ProposalsState {
  const factory ProposalsState.initial() = ProposalsInitial;
  const factory ProposalsState.loading() = ProposalsLoading;
  const factory ProposalsState.success(
    List<PurchaseProposalModel> proposals,
  ) = ProposalsSuccess;
  const factory ProposalsState.compareSuccess(
    List<DrugComparisonModel> comparisons,
  ) = ProposalsCompareSuccess;
  const factory ProposalsState.generateSuccess(
    PurchaseProposalModel proposal,
  ) = ProposalsGenerateSuccess;
  const factory ProposalsState.approveSuccess(
    PurchaseProposalModel proposal,
  ) = ProposalsApproveSuccess;
  const factory ProposalsState.rejectSuccess(
    PurchaseProposalModel proposal,
  ) = ProposalsRejectSuccess;
  const factory ProposalsState.statusSuccess(
    ProposalStatusModel status,
  ) = ProposalsStatusSuccess;
  const factory ProposalsState.detailSuccess(
    PurchaseProposalModel proposal,
  ) = ProposalsDetailSuccess;
  const factory ProposalsState.error({required String error}) = ProposalsError;
}
