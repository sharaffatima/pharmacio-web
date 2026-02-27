import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
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
            child: BlocBuilder<CompareCubit, CompareState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (offers) => _buildContent(context, offers),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<CompareOfferItem> offers) {
    final cubit = context.read<CompareCubit>();
    return SingleChildScrollView(
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
                  onToggle: cubit.toggleOffer,
                ),
              ),
              horizontalSpace(24),
              Expanded(
                flex: 1,
                child: SelectionSummaryWidget(
                  selectedCount: cubit.selectedCount,
                  onCompare: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
