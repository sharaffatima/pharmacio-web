import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/widgets/proposals_table_widget.dart';

part '../states/proposals_state.dart';
part 'proposals_cubit.freezed.dart';

class ProposalsCubit extends Cubit<ProposalsState> {
  ProposalsCubit() : super(const ProposalsState.initial());

  List<ProposalEntry> _allProposals = [];
  String searchQuery = '';
  String selectedStatus = 'All Statuses';

  void loadData() {
    emit(const ProposalsState.loading());
    _allProposals = ProposalEntry.sampleData();
    _emitFiltered();
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
