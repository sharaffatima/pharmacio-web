import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/compare_offers_request_body.dart';
import '../../data/models/drug_comparison_model.dart';
import '../../data/models/proposal_status_model.dart';
import '../../data/models/purchase_proposal_model.dart';
import '../../data/repos/proposals_repo.dart';

part '../states/proposals_state.dart';
part 'proposals_cubit.freezed.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo _proposalsRepo;

  ProposalsCubit(this._proposalsRepo) : super(const ProposalsState.initial());

  List<PurchaseProposalModel> _allProposals = [];
  String searchQuery = '';
  String selectedStatus = 'All Statuses';

  // ─── Computed ─────────────────────────────────────────────────────────────
  int get totalCount => _allProposals.length;
  int countByStatus(String status) =>
      _allProposals.where((p) => p.status == status).length;

  // ─── Load List ────────────────────────────────────────────────────────────
  Future<void> loadData() async {
    emit(const ProposalsState.loading());
    try {
      _allProposals = await _proposalsRepo.getProposals();
      _emitFiltered();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Compare Offers ───────────────────────────────────────────────────────
  Future<void> compareOffers(List<int> ocrResultIds) async {
    emit(const ProposalsState.loading());
    try {
      final comparisons = await _proposalsRepo.compareOffers(
        CompareOffersRequestBody(ocrResultIds: ocrResultIds),
      );
      emit(ProposalsState.compareSuccess(comparisons));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Generate Proposal ────────────────────────────────────────────────────
  Future<void> generateProposal(List<int> ocrResultIds) async {
    emit(const ProposalsState.loading());
    try {
      final proposal = await _proposalsRepo.generateProposal(
        CompareOffersRequestBody(ocrResultIds: ocrResultIds),
      );
      emit(ProposalsState.generateSuccess(proposal));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Approve ──────────────────────────────────────────────────────────────
  Future<void> approveProposal(int id) async {
    emit(const ProposalsState.loading());
    try {
      final proposal = await _proposalsRepo.approveProposal(id);
      // Update local list in-place
      _allProposals = _allProposals
          .map((p) => p.id == id ? proposal : p)
          .toList();
      emit(ProposalsState.approveSuccess(proposal));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Reject ───────────────────────────────────────────────────────────────
  Future<void> rejectProposal(int id) async {
    emit(const ProposalsState.loading());
    try {
      final proposal = await _proposalsRepo.rejectProposal(id);
      _allProposals = _allProposals
          .map((p) => p.id == id ? proposal : p)
          .toList();
      emit(ProposalsState.rejectSuccess(proposal));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Get Detail ──────────────────────────────────────────────────────────
  Future<void> getProposalDetail(int id) async {
    emit(const ProposalsState.loading());
    try {
      final proposal = await _proposalsRepo.getProposalDetail(id);
      emit(ProposalsState.detailSuccess(proposal));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Get Status ───────────────────────────────────────────────────────────
  Future<void> getProposalStatus(int id) async {
    emit(const ProposalsState.loading());
    try {
      final status = await _proposalsRepo.getProposalStatus(id);
      emit(ProposalsState.statusSuccess(status));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProposalsState.error(error: message));
    }
  }

  // ─── Local Filters ────────────────────────────────────────────────────────
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
    selectedStatus = 'All Statuses';
    _emitFiltered();
  }

  void _emitFiltered() {
    var filtered = List<PurchaseProposalModel>.from(_allProposals);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) =>
                p.createdBy.toLowerCase().contains(searchQuery.toLowerCase()) ||
                p.id.toString().contains(searchQuery),
          )
          .toList();
    }

    if (selectedStatus != 'All Statuses') {
      final statusKey = selectedStatus.toLowerCase();
      filtered = filtered.where((p) => p.status == statusKey).toList();
    }

    emit(ProposalsState.success(filtered));
  }
}
