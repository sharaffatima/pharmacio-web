part of '../cubit/proposals_cubit.dart';

@freezed
class ProposalsState with _$ProposalsState {
  const factory ProposalsState.initial() = ProposalsInitial;
  const factory ProposalsState.loading() = ProposalsLoading;
  const factory ProposalsState.success(List<ProposalEntry> proposals) =
      ProposalsSuccess;
  const factory ProposalsState.error({required String error}) = ProposalsError;
}
