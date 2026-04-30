import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/file_downloader.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/purchase_proposal_model.dart';
import '../../logic/cubit/proposals_cubit.dart';
import 'proposal_details_screen.dart';
import '../widgets/proposals_filters_widget.dart';
import '../widgets/proposals_header_widget.dart';
import '../widgets/proposals_stat_cards_widget.dart';
import '../widgets/proposals_table_widget.dart';

class ProposalsScreen extends StatelessWidget {
  const ProposalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 4,
      body: BlocConsumer<ProposalsCubit, ProposalsState>(
        listener: (context, state) {
          state.whenOrNull(
            successApproveProposal: (proposal, proposals) {
              showAppSnackBar(
                context,
                AppStrings.proposalApprovedSuccess,
              );
            },
            successRejectProposal: (proposal, proposals) {
              showAppSnackBar(
                context,
                AppStrings.proposalRejectedSuccess,
              );
            },
            successGetProposalStatus: (status, proposals) {
              showAppSnackBar(
                context,
                '${AppStrings.currentStatusLabel}: ${status.status ?? '-'}',
              );
            },
            error: (error) => showAppSnackBar(context, error),
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            error: (error) => RetryButtonWidget(
              message: error,
              onRetry: () => context.read<ProposalsCubit>().loadData(),
            ),
            successGetProposalsList: (proposals) =>
                _buildContent(context, proposals),
            successGetProposalDetail: (proposal, proposals) =>
                _buildContent(context, proposals),
            successGetProposalStatus: (status, proposals) =>
                _buildContent(context, proposals),
            successApproveProposal: (proposal, proposals) =>
                _buildContent(context, proposals),
            successRejectProposal: (proposal, proposals) =>
                _buildContent(context, proposals),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<PurchaseProposalModel> proposals,
  ) {
    final cubit = context.read<ProposalsCubit>();
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;
    final statuses = [
      AppStrings.allStatuses,
      AppStrings.pending,
      AppStrings.approved,
      AppStrings.rejected,
    ];
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProposalsHeaderWidget(),
                verticalSpace(12),
                _buildDownloadAllButton(context),
              ],
            )
          else
            Row(
              children: [
                const Expanded(child: ProposalsHeaderWidget()),
                _buildDownloadAllButton(context),
              ],
            ),
          verticalSpace(24),
          ProposalsStatCardsWidget(
            total: cubit.totalCount,
            pending: cubit.countByStatus(AppStrings.pending),
            approved: cubit.countByStatus(AppStrings.approved),
            rejected: cubit.countByStatus(AppStrings.rejected),
          ),
          verticalSpace(24),
          ProposalsFiltersWidget(
            searchController: TextEditingController(text: cubit.searchQuery)
              ..selection = TextSelection.collapsed(
                offset: cubit.searchQuery.length,
              ),
            onSearchChanged: cubit.updateSearch,
            selectedStatus: cubit.selectedStatus,
            statuses: statuses,
            onStatusChanged: cubit.updateStatus,
            onClearFilters: cubit.clearFilters,
          ),
          verticalSpace(24),
          ProposalsTableWidget(
            entries: proposals,
            onView: (i) => _showProposalActionsDialog(context, proposals[i]),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadAllButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleDownloadAll(context),
      icon: Icon(Icons.archive_outlined, size: 18.sp),
      label: Text(AppStrings.downloadAllZip),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.charcoalBlack,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  Future<void> _handleDownloadAll(BuildContext context) async {
    showAppSnackBar(context, AppStrings.downloadStarted);
    final bytes = await context
        .read<ProposalsCubit>()
        .downloadAllProposalsZipBytes();
    if (bytes == null || bytes.isEmpty) return;

    FileDownloader.downloadBytes(
      bytes: Uint8List.fromList(bytes),
      filename: 'proposals.zip',
      mimeType: 'application/zip',
    );
  }

  Future<void> _showProposalActionsDialog(
    BuildContext context,
    PurchaseProposalModel proposal,
  ) async {
    await showDialog(
      context: context,
      barrierColor: AppColors.blackOverlay45,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: AppColors.transparent,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            width: 560.w,
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.gainsboro, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackOverlay08,
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        color: AppColors.skyBlue.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.description_outlined,
                        size: 18.sp,
                        color: AppColors.skyBlue,
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.proposalNumber(
                              (proposal.id ?? '-').toString(),
                            ),
                            style: AppTextStyles.font16BlackSemiBold,
                          ),
                          verticalSpace(2),
                          Text(
                            AppStrings.chooseProposalActionDescription,
                            style: AppTextStyles.font12GreyRegular,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(dialogContext).pop(),
                      borderRadius: BorderRadius.circular(8.r),
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: Icon(
                          Icons.close,
                          size: 18.sp,
                          color: AppColors.coolGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(18),
                Row(
                  children: [
                    Expanded(
                      child: _buildDialogInfoTile(
                        label: AppStrings.items,
                        value: (proposal.items?.length ?? 0).toString(),
                      ),
                    ),
                    horizontalSpace(12),
                    Expanded(
                      child: _buildDialogInfoTile(
                        label: AppStrings.total,
                        value: proposal.totalCost ?? '-',
                      ),
                    ),
                  ],
                ),
                verticalSpace(12),
                _buildDialogInfoTile(
                  label: AppStrings.status,
                  value: _statusLabel(proposal.status ?? ''),
                  statusColor: _statusColor(proposal.status ?? ''),
                ),
                verticalSpace(20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          _openProposalDetailsPage(context, proposal);
                        },
                        icon: Icon(
                          Icons.visibility_outlined,
                          size: 18.sp,
                          color: AppColors.charcoalBlack,
                        ),
                        label: Text(AppStrings.details),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.gainsboro),
                          foregroundColor: AppColors.charcoalBlack,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          final id = proposal.id;
                          if (id == null) {
                            showAppSnackBar(
                              context,
                              AppStrings.cannotContinueMissingProposalId,
                            );
                            return;
                          }
                          context.read<ProposalsCubit>().getProposalStatus(id);
                        },
                        icon: Icon(
                          Icons.query_stats,
                          size: 18.sp,
                          color: AppColors.coolGrey,
                        ),
                        label: Text(AppStrings.status),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.gainsboro),
                          foregroundColor: AppColors.coolGrey,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          final id = proposal.id;
                          if (id == null) {
                            showAppSnackBar(
                              context,
                              AppStrings.cannotContinueMissingProposalId,
                            );
                            return;
                          }
                          context.read<ProposalsCubit>().approveProposal(id);
                        },
                        icon: Icon(Icons.check_circle, size: 18.sp),
                        label: Text(AppStrings.approveAction),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.emerald,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          final id = proposal.id;
                          if (id == null) {
                            showAppSnackBar(
                              context,
                              AppStrings.cannotContinueMissingProposalId,
                            );
                            return;
                          }
                          context.read<ProposalsCubit>().rejectProposal(id);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 18.sp,
                          color: AppColors.brightRed,
                        ),
                        label: Text(AppStrings.rejectAction),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.brightRed),
                          foregroundColor: AppColors.brightRed,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openProposalDetailsPage(
    BuildContext context,
    PurchaseProposalModel proposal,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProposalDetailsScreen(proposal: proposal),
      ),
    );
  }

  Widget _buildDialogInfoTile({
    required String label,
    required String value,
    Color? statusColor,
  }) {
    final hasStatus = statusColor != null;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTextStyles.font12GreyRegular),
                verticalSpace(2),
                Text(value, style: AppTextStyles.font14BlackRegular),
              ],
            ),
          ),
          if (hasStatus)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                value,
                style: AppTextStyles.font12GreyRegular.copyWith(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _statusLabel(String status) {
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

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return AppColors.emerald;
      case 'rejected':
        return AppColors.brightRed;
      case 'pending':
      default:
        return AppColors.saffronAmber;
    }
  }
}
