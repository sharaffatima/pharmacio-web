import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repos/proposals_repo.dart';
import '../../presentation/widgets/proposals_table_widget.dart';

part '../states/proposals_state.dart';
part 'proposals_cubit.freezed.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  final ProposalsRepo proposalsRepo;

  ProposalsCubit(this.proposalsRepo)
      : super(const ProposalsState.initial());

  List<ProposalEntry> _allProposals = [];
  String searchQuery = '';
  String selectedStatus = 'All Statuses';

  Future<void> loadData() async {
    emit(const ProposalsState.loading());

    try {
      final response = await proposalsRepo.getProposals();

      _allProposals = response.map((item) {
        final map = item as Map<String, dynamic>;

        return ProposalEntry(
          id: map['id'] is int
              ? map['id'] as int
              : int.tryParse(map['id']?.toString() ?? '0') ?? 0,
          name: map['name']?.toString() ?? 'N/A',
          createdDate: map['created_at']?.toString() ?? '',
          createdBy: map['created_by']?.toString() ?? 'Unknown',
          totalValue: map['total_value']?.toString() ?? '0',
          items: map['items_count'] is int
              ? map['items_count'] as int
              : int.tryParse(map['items_count']?.toString() ?? '0') ?? 0,
          status: map['status']?.toString() ?? 'Pending',
        );
      })
      toList();

      _emitFiltered();
    } catch (e) {
      emit(const ProposalsState.error(error: 'Failed to load proposals'));
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
    selectedStatus = 'All Statuses';
    _emitFiltered();
  }

  int countByStatus(String status) =>
      _allProposals.where((p) => p.status == status).length;

  int get totalCount => _allProposals.length;

  void _emitFiltered() {
    var filtered = List<ProposalEntry>.from(_allProposals);

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()),
      )
          .toList();
    }

    if (selectedStatus != 'All Statuses') {
      filtered = filtered.where((p) => p.status == selectedStatus).toList();
    }

    emit(ProposalsState.success(filtered));
  }
}