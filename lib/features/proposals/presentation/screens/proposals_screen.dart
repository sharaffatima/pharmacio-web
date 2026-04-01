import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../data/models/purchase_proposal_model.dart';
import '../../logic/cubit/proposals_cubit.dart';
import '../widgets/proposals_filters_widget.dart';
import '../widgets/proposals_header_widget.dart';
import '../widgets/proposals_stat_cards_widget.dart';
import '../widgets/proposals_table_widget.dart';

class ProposalsScreen extends StatelessWidget {
  const ProposalsScreen({super.key});

  static const _statuses = [
    'All Statuses',
    'Pending',
    'Approved',
    'Rejected',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 4),
          Expanded(
            child: BlocConsumer<ProposalsCubit, ProposalsState>(
              listener: (context, state) {
                state.whenOrNull(
                  approveSuccess: (proposal) {
                    showAppSnackBar(
                      context,
                      'Proposal #${proposal.id} approved',
                    );
                    context.read<ProposalsCubit>().loadData();
                  },
                  rejectSuccess: (proposal) {
                    showAppSnackBar(
                      context,
                      'Proposal #${proposal.id} rejected',
                      isError: true,
                    );
                    context.read<ProposalsCubit>().loadData();
                  },
                  generateSuccess: (proposal) {
                    showAppSnackBar(
                      context,
                      'Proposal #${proposal.id} generated successfully',
                    );
                    context.read<ProposalsCubit>().loadData();
                  },
                  detailSuccess: (proposal) {
                    // detail loaded — dialog opened from table widget
                    context.read<ProposalsCubit>().loadData();
                  },
                  error: (msg) {
                    showAppSnackBar(context, msg, isError: true);
                  },
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (proposals) => _buildContent(context, proposals),
                  compareSuccess: (_) => const LoadingWidget(),
                  generateSuccess: (_) => const LoadingWidget(),
                  approveSuccess: (_) => const LoadingWidget(),
                  rejectSuccess: (_) => const LoadingWidget(),
                  statusSuccess: (_) => const LoadingWidget(),
                  detailSuccess: (_) => const LoadingWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<PurchaseProposalModel> proposals,
  ) {
    final cubit = context.read<ProposalsCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProposalsHeaderWidget(),
          verticalSpace(24),
          ProposalsStatCardsWidget(
            total: cubit.totalCount,
            pending: cubit.countByStatus('pending'),
            approved: cubit.countByStatus('approved'),
            rejected: cubit.countByStatus('rejected'),
          ),
          verticalSpace(24),
          ProposalsFiltersWidget(
            searchController: TextEditingController(text: cubit.searchQuery)
              ..selection = TextSelection.collapsed(
                offset: cubit.searchQuery.length,
              ),
            selectedStatus: cubit.selectedStatus,
            statuses: _statuses,
            onStatusChanged: cubit.updateStatus,
            onClearFilters: cubit.clearFilters,
          ),
          verticalSpace(24),
          ProposalsTableWidget(
            entries: proposals,
            onApprove: (proposal) => cubit.approveProposal(proposal.id),
            onReject: (proposal) => cubit.rejectProposal(proposal.id),
            // Triggers GET /purchase-proposals/{id}/ for fresh detail data
            onViewDetail: (proposal) => cubit.getProposalDetail(proposal.id),
          ),
        ],
      ),
    );
  }
}
