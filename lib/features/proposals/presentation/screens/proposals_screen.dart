import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../logic/cubit/proposals_cubit.dart';
import '../widgets/proposals_filters_widget.dart';
import '../widgets/proposals_header_widget.dart';
import '../widgets/proposals_stat_cards_widget.dart';
import '../widgets/proposals_table_widget.dart';

class ProposalsScreen extends StatelessWidget {
  const ProposalsScreen({super.key});

  static final _statuses = ['All Statuses', 'Pending', 'Approved', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 4),
          Expanded(
            child: BlocBuilder<ProposalsCubit, ProposalsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (proposals) => _buildContent(context, proposals),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<ProposalEntry> proposals) {
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
            pending: cubit.countByStatus('Pending'),
            approved: cubit.countByStatus('Approved'),
            rejected: cubit.countByStatus('Rejected'),
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
          ProposalsTableWidget(entries: proposals, onView: (i) {}),
        ],
      ),
    );
  }
}
