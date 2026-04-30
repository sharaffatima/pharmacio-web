import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/compare_available_offer_item.dart';
import '../../data/models/compare_offer_result_model.dart';
import '../../logic/cubit/compare_cubit.dart';
import '../widgets/available_offers_widget.dart';
import '../widgets/compare_header_widget.dart';
import '../widgets/compare_results_widget.dart';
import '../widgets/selection_summary_widget.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 3,
      body: BlocConsumer<CompareCubit, CompareState>(
        listener: (context, state) {
          state.whenOrNull(
            successGenerateProposal:
                (offers, selectedOfferIds, comparedResults, proposal) {
                  final message = AppStrings.proposalGeneratedSuccess;
                  showAppSnackBar(context, message);
                  Navigator.of(context).pushNamed(Routes.proposalsScreen);
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
              onRetry: () => context.read<CompareCubit>().loadData(),
            ),
            successGetAvailableOffers:
                (
                  offers,
                  selectedOfferIds,
                  comparedResults,
                  generatedProposal,
                ) => _buildContent(
                  context,
                  offers,
                  selectedOfferIds,
                  comparedResults,
                ),
            successCompareOffers:
                (
                  offers,
                  selectedOfferIds,
                  comparedResults,
                  generatedProposal,
                ) => _buildContent(
                  context,
                  offers,
                  selectedOfferIds,
                  comparedResults,
                ),
            successGenerateProposal:
                (offers, selectedOfferIds, comparedResults, proposal) =>
                    _buildContent(
                      context,
                      offers,
                      selectedOfferIds,
                      comparedResults,
                    ),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<CompareAvailableOfferItem> offers,
    List<int> selectedOfferIds,
    List<CompareOfferResultModel> comparedResults,
  ) {
    final cubit = context.read<CompareCubit>();
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;

    final summary = SelectionSummaryWidget(
      selectedCount: cubit.selectedCount,
      comparedItemsCount: comparedResults.length,
      onCompare: cubit.compareSelectedOffers,
      onGenerateProposal: cubit.generateProposal,
    );
    final available = AvailableOffersWidget(
      offers: offers,
      selectedOfferIds: selectedOfferIds.toSet(),
      onToggle: cubit.toggleOffer,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CompareHeaderWidget(),
          verticalSpace(24),
          if (isMobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                available,
                verticalSpace(16),
                summary,
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: available),
                horizontalSpace(24),
                Expanded(flex: 1, child: summary),
              ],
            ),
          verticalSpace(24),
          CompareResultsWidget(results: comparedResults),
        ],
      ),
    );
  }
}
