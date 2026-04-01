import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../../proposals/data/models/drug_comparison_model.dart';
import '../../../proposals/logic/cubit/proposals_cubit.dart';
import '../../logic/cubit/compare_cubit.dart';
import '../widgets/available_offers_widget.dart';
import '../widgets/compare_header_widget.dart';
import '../widgets/selection_summary_widget.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 3),
          Expanded(
            child: BlocConsumer<ProposalsCubit, ProposalsState>(
              listener: (context, state) {
                state.whenOrNull(
                  generateSuccess: (proposal) {
                    showAppSnackBar(
                      context,
                      'Proposal #${proposal.id} generated successfully',
                    );
                  },
                  error: (msg) => showAppSnackBar(context, msg, isError: true),
                );
              },
              builder: (context, proposalState) {
                // Extract compare results if available
                final comparisons = proposalState.whenOrNull(
                  compareSuccess: (c) => c,
                );
                final isProposalLoading = proposalState.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return BlocBuilder<CompareCubit, CompareState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const LoadingWidget(),
                      loading: () => const LoadingWidget(),
                      error: (error) => Center(child: Text(error)),
                      success: (offers) => _buildContent(
                        context,
                        offers,
                        comparisons,
                        isProposalLoading,
                      ),
                    );
                  },
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
    List<CompareOfferItem> offers,
    List<DrugComparisonModel>? comparisons,
    bool isProposalLoading,
  ) {
    final compareCubit = context.read<CompareCubit>();
    final proposalsCubit = context.read<ProposalsCubit>();

    // Get selected offer IDs for API calls
    final selectedIds = offers
        .asMap()
        .entries
        .where((e) => e.value.isSelected && e.value.ocrResultId != null)
        .map((e) => e.value.ocrResultId!)
        .toList();

    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CompareHeaderWidget(),
              verticalSpace(24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: AvailableOffersWidget(
                      offers: offers,
                      onToggle: compareCubit.toggleOffer,
                    ),
                  ),
                  horizontalSpace(24),
                  Expanded(
                    flex: 1,
                    child: SelectionSummaryWidget(
                      selectedCount: compareCubit.selectedCount,
                      hasRealIds: selectedIds.isNotEmpty,
                      onCompare: () {
                        if (selectedIds.isNotEmpty) {
                          // Use real API
                          proposalsCubit.compareOffers(selectedIds);
                        } else {
                          // Fallback info — no real IDs available yet
                          showAppSnackBar(
                            context,
                            'Upload and process files first to get real comparison data',
                            isError: true,
                          );
                        }
                      },
                      onGenerate: selectedIds.isNotEmpty
                          ? () => proposalsCubit.generateProposal(selectedIds)
                          : null,
                    ),
                  ),
                ],
              ),

              // ─── Compare Results Panel ────────────────────────────────────
              if (comparisons != null && comparisons.isNotEmpty) ...[
                verticalSpace(32),
                _buildCompareResultsPanel(comparisons),
              ],
            ],
          ),
        ),

        // Loading overlay when generating proposal
        if (isProposalLoading)
          Container(
            color: AppColors.white.withValues(alpha: 0.6),
            child: const Center(child: LoadingWidget()),
          ),
      ],
    );
  }

  // ─── Compare Results Panel ─────────────────────────────────────────────────
  Widget _buildCompareResultsPanel(List<DrugComparisonModel> comparisons) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.compare_arrows, size: 20.sp, color: AppColors.skyBlue),
              horizontalSpace(8),
              Text(
                'Comparison Results (${comparisons.length} drugs)',
                style: AppTextStyles.font16BlackSemiBold,
              ),
            ],
          ),
          verticalSpace(16),

          // Header
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text('Drug', style: AppTextStyles.font13GreyRegular),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Company', style: AppTextStyles.font13GreyRegular),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Best Price', style: AppTextStyles.font13GreyRegular),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Warehouse', style: AppTextStyles.font13GreyRegular),
                ),
                SizedBox(
                  width: 80.w,
                  child: Text('Status', style: AppTextStyles.font13GreyRegular),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.gainsboro, height: 1),

          ...comparisons.map((drug) => _buildDrugRow(drug)),
        ],
      ),
    );
  }

  Widget _buildDrugRow(DrugComparisonModel drug) {
    final isFound = drug.status == 'found';
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              drug.drugName,
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              drug.company ?? '—',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              isFound && drug.best != null ? drug.best!.price : '—',
              style: AppTextStyles.font13BlackMedium.copyWith(
                color: isFound ? AppColors.emerald : AppColors.coolGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              isFound && drug.best != null ? drug.best!.wareHouseName : '—',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
              decoration: BoxDecoration(
                color: isFound
                    ? AppColors.emerald.withValues(alpha: 0.1)
                    : AppColors.coolGrey.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                isFound ? 'Found' : 'Not Found',
                style: AppTextStyles.font12GreyRegular.copyWith(
                  color: isFound ? AppColors.emerald : AppColors.coolGrey,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
