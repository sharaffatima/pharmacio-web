import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/file_downloader.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/proposal_item_model.dart';
import '../../data/models/purchase_proposal_model.dart';
import '../../logic/cubit/proposals_cubit.dart';
import '../widgets/supplier_section_widget.dart';

class ProposalDetailsScreen extends StatelessWidget {
  final PurchaseProposalModel proposal;

  const ProposalDetailsScreen({super.key, required this.proposal});

  @override
  Widget build(BuildContext context) {
    // Provide a fresh ProposalsCubit so download/print actions inside
    // this screen can talk to the repository without depending on the
    // parent cubit (which may be disposed once we navigate back).
    return BlocProvider(
      create: (_) => getIt<ProposalsCubit>(),
      child: ResponsiveScaffold(
        selectedIndex: 4,
        body: BlocListener<ProposalsCubit, ProposalsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) => showAppSnackBar(context, error),
            );
          },
          child: Builder(
            builder: (context) => _buildScrollBody(context),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollBody(BuildContext context) {
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, isMobile),
          verticalSpace(20),
          _buildSummaryCard(),
          verticalSpace(24),
          _buildSuppliersList(context),
        ],
      ),
    );
  }

  // ─── Header (back + title + actions) ────────────────
  Widget _buildHeader(BuildContext context, bool isMobile) {
    final actions = [
      _buildPrintButton(context),
      horizontalSpace(8),
      _buildDownloadButton(context),
    ];

    final titleColumn = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.proposalNumber((proposal.id ?? '-').toString()),
            style: AppTextStyles.font24BlackBold,
          ),
          verticalSpace(2),
          Text(
            AppStrings.proposalDetailsSubtitle,
            style: AppTextStyles.font14GreyMedium,
          ),
        ],
      ),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildBackButton(context),
              horizontalSpace(12),
              titleColumn,
            ],
          ),
          verticalSpace(12),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              _buildPrintButton(context),
              _buildDownloadButton(context),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        _buildBackButton(context),
        horizontalSpace(12),
        titleColumn,
        ...actions,
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Navigator.of(context).canPop()) {
          context.pop();
        }
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.gainsboro),
        ),
        child: Icon(
          Icons.arrow_back,
          size: 20.sp,
          color: AppColors.charcoalBlack,
        ),
      ),
    );
  }

  Widget _buildPrintButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => FileDownloader.printCurrentPage(),
      icon: Icon(Icons.print_outlined, size: 18.sp),
      label: Text(AppStrings.printProposal),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColors.gainsboro),
        foregroundColor: AppColors.charcoalBlack,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  Widget _buildDownloadButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => _handleDownloadPdf(context),
      icon: Icon(Icons.download_outlined, size: 18.sp),
      label: Text(AppStrings.downloadPdf),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.charcoalBlack,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  Future<void> _handleDownloadPdf(BuildContext context) async {
    final id = proposal.id;
    if (id == null) {
      showAppSnackBar(
        context,
        AppStrings.cannotContinueMissingProposalId,
      );
      return;
    }

    showAppSnackBar(context, AppStrings.downloadStarted);
    final bytes = await context
        .read<ProposalsCubit>()
        .downloadProposalPdfBytes(id);
    if (bytes == null || bytes.isEmpty) return;

    FileDownloader.downloadBytes(
      bytes: Uint8List.fromList(bytes),
      filename: 'proposal_$id.pdf',
    );
  }

  // ─── Summary Card ───────────────────────────────────
  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.proposalSummary,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              _buildInfoTile(
                label: AppStrings.status,
                value: _statusLabel(proposal.status ?? ""),
                statusColor: _statusColor(proposal.status ?? ""),
              ),
              _buildInfoTile(
                label: AppStrings.totalCostLabel,
                value: proposal.totalCost ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.items,
                value: (proposal.items ?? []).length.toString(),
              ),
              _buildInfoTile(
                label: AppStrings.createdBy,
                value: proposal.createdBy ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.approvedByLabel,
                value: proposal.approvedBy ?? '-',
              ),
              _buildInfoTile(
                label: AppStrings.createdAtLabel,
                value: _formatDateTime(proposal.createdAt),
              ),
              _buildInfoTile(
                label: AppStrings.updatedAtLabel,
                value: _formatDateTime(proposal.updatedAt),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required String label,
    required String value,
    Color? statusColor,
  }) {
    final hasStatus = statusColor != null;

    return Container(
      width: 210.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.offWhiteGrey,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.font12GreyRegular),
          verticalSpace(2),
          if (!hasStatus)
            Text(
              value,
              style: AppTextStyles.font14BlackRegular,
              overflow: TextOverflow.ellipsis,
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

  // ─── Suppliers Sections ─────────────────────────────
  Widget _buildSuppliersList(BuildContext context) {
    final items = proposal.items ?? const <ProposalItemModel>[];

    if (items.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.gainsboro, width: 1),
        ),
        child: Text(
          AppStrings.noItemsFound,
          style: AppTextStyles.font13GreyRegular,
        ),
      );
    }

    // Group items by supplier (company). Items with no company fall
    // into a single "Unknown Supplier" bucket so they're still visible.
    final Map<String, List<ProposalItemModel>> grouped = {};
    for (final item in items) {
      final key = (item.company == null || item.company!.trim().isEmpty)
          ? AppStrings.unknownSupplier
          : item.company!.trim();
      grouped.putIfAbsent(key, () => []).add(item);
    }

    final entries = grouped.entries.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 4.w, bottom: 12.h),
          child: Text(
            AppStrings.proposalItems,
            style: AppTextStyles.font16BlackSemiBold,
          ),
        ),
        ...entries.map((e) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: SupplierSectionWidget(
              supplierName: e.key,
              items: e.value,
              subtotalDisplay: _formatSubtotal(e.value),
            ),
          );
        }),
      ],
    );
  }

  /// Best-effort subtotal formatter. Tries to parse [lineTotal]
  /// strings (e.g. "120.50", "$120.50") into numbers; if any item
  /// can't be parsed we return null and let the widget hide the chip.
  String? _formatSubtotal(List<ProposalItemModel> items) {
    double total = 0;
    var anyParsed = false;
    for (final item in items) {
      final raw = item.lineTotal;
      if (raw == null || raw.isEmpty) continue;
      final cleaned = raw.replaceAll(RegExp(r'[^0-9.\-]'), '');
      final value = double.tryParse(cleaned);
      if (value != null) {
        total += value;
        anyParsed = true;
      }
    }
    if (!anyParsed) return null;
    return total.toStringAsFixed(2);
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return '-';
    final local = dateTime.toLocal();
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$year-$month-$day  $hour:$minute';
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
