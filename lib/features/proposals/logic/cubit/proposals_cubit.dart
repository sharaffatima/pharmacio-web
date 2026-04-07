import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/proposal_status_response.dart';
import '../../data/models/purchase_proposal_model.dart';
import '../../data/repos/proposals_repo.dart';

part '../states/proposals_state.dart';
part 'proposals_cubit.freezed.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo _proposalsRepo;

  ProposalsCubit(this._proposalsRepo) : super(const ProposalsState.initial());

  List<PurchaseProposalModel> _allProposals = [];
  String searchQuery = '';
  String selectedStatus = AppStrings.allStatuses;

  Future<void> loadData() async {
    emit(const ProposalsState.loading());

    try {
      final response = await _proposalsRepo.getProposalsList();
      _allProposals = response.results ?? [];
      _emitFiltered();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  void updateSearch(String query) {
    searchQuery = query;
    _emitFiltered();
  }

  void updateStatus(String status) {
    selectedStatus = status;
    _emitFiltered();
  }

  void clearFilters() {
    searchQuery = '';
    selectedStatus = AppStrings.allStatuses;
    _emitFiltered();
  }

  Future<void> getProposalDetail(int proposalId) async {
    emit(const ProposalsState.loading());

    try {
      final proposal = await _proposalsRepo.getProposalDetail(proposalId);
      _emitFiltered(detailProposal: proposal);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  Future<void> getProposalStatus(int proposalId) async {
    emit(const ProposalsState.loading());

    try {
      final status = await _proposalsRepo.getProposalStatus(proposalId);
      _emitFiltered(statusResponse: status);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  Future<void> approveProposal(int proposalId) async {
    emit(const ProposalsState.loading());

    try {
      final proposal = await _proposalsRepo.approveProposal(proposalId);
      await _refreshList();
      _emitFiltered(approvedProposal: proposal);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  Future<void> rejectProposal(int proposalId) async {
    emit(const ProposalsState.loading());

    try {
      final proposal = await _proposalsRepo.rejectProposal(proposalId);
      await _refreshList();
      _emitFiltered(rejectedProposal: proposal);
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  int countByStatus(String status) => _allProposals
      .where(
        (p) =>
            _statusLabel(p.status ?? '').toLowerCase() == status.toLowerCase(),
      )
      .length;

  int get totalCount => _allProposals.length;

  Future<void> _refreshList() async {
    final response = await _proposalsRepo.getProposalsList();
    _allProposals = response.results ?? [];
  }

  void _emitFiltered({
    PurchaseProposalModel? detailProposal,
    ProposalStatusResponse? statusResponse,
    PurchaseProposalModel? approvedProposal,
    PurchaseProposalModel? rejectedProposal,
  }) {
    var filtered = List<PurchaseProposalModel>.from(_allProposals);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) =>
                p.id.toString().contains(searchQuery.toLowerCase()) ||
                (p.createdBy ?? '').toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                (p.items ?? []).any(
                  (item) => (item.productName ?? '').toLowerCase().contains(
                    searchQuery.toLowerCase(),
                  ),
                ),
          )
          .toList();
    }

    if (selectedStatus != AppStrings.allStatuses) {
      filtered = filtered
          .where(
            (p) =>
                _statusLabel(p.status ?? '').toLowerCase() ==
                selectedStatus.toLowerCase(),
          )
          .toList();
    }

    if (detailProposal != null) {
      emit(
        ProposalsState.successGetProposalDetail(
          proposal: detailProposal,
          proposals: filtered,
        ),
      );
      return;
    }

    if (statusResponse != null) {
      emit(
        ProposalsState.successGetProposalStatus(
          status: statusResponse,
          proposals: filtered,
        ),
      );
      return;
    }

    if (approvedProposal != null) {
      emit(
        ProposalsState.successApproveProposal(
          proposal: approvedProposal,
          proposals: filtered,
        ),
      );
      return;
    }

    if (rejectedProposal != null) {
      emit(
        ProposalsState.successRejectProposal(
          proposal: rejectedProposal,
          proposals: filtered,
        ),
      );
      return;
    }

    emit(ProposalsState.successGetProposalsList(filtered));
  }

  String _statusLabel(String status) {
    if (status.trim().isEmpty) {
      return AppStrings.pending;
    }
    switch (status.toLowerCase()) {
      case 'approved':
        return AppStrings.approved;
      case 'rejected':
        return AppStrings.rejected;
      case 'pending':
      default:
        return AppStrings.pending;
    }
  }
}
