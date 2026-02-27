import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../logic/cubit/alerts_cubit.dart';
import '../widgets/alerts_header_widget.dart';
import '../widgets/alerts_list_widget.dart';
import '../widgets/alerts_stat_cards_widget.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 6),
          Expanded(
            child: BlocBuilder<AlertsCubit, AlertsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (alerts, tabIndex, selectedSeverity) =>
                      _buildContent(
                        context,
                        alerts,
                        tabIndex,
                        selectedSeverity,
                      ),
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
    List<AlertItem> alerts,
    int tabIndex,
    String selectedSeverity,
  ) {
    final cubit = context.read<AlertsCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AlertsHeaderWidget(),
          verticalSpace(24),

          AlertsStatCardsWidget(
            activeAlerts: cubit.activeCount,
            criticalAlerts: cubit.criticalCount,
            resolvedToday: cubit.resolvedTodayCount,
          ),
          verticalSpace(24),

          // ─── Tabs ──────────────────────────
          Row(
            children: [
              _buildTab(
                AppStrings.alerts,
                0,
                tabIndex,
                () => cubit.switchTab(0),
              ),
              horizontalSpace(4),
              _buildTab(
                AppStrings.auditLogs,
                1,
                tabIndex,
                () => cubit.switchTab(1),
              ),
            ],
          ),
          verticalSpace(16),

          if (tabIndex == 0) ...[
            Container(
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
                    AppStrings.filterAlerts,
                    style: AppTextStyles.font16BlackSemiBold,
                  ),
                  verticalSpace(12),
                  Container(
                    height: 40.h,
                    width: 200.w,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gainsboro),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedSeverity,
                        isExpanded: true,
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          size: 20.sp,
                          color: AppColors.coolGrey,
                        ),
                        style: AppTextStyles.font14BlackRegular,
                        items: ['All Severities', 'Critical', 'Warning', 'Info']
                            .map(
                              (s) => DropdownMenuItem(value: s, child: Text(s)),
                            )
                            .toList(),
                        onChanged: (v) {
                          if (v != null) cubit.updateSeverity(v);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(24),
            AlertsListWidget(alerts: alerts, onResolve: cubit.resolveAlert),
          ],

          if (tabIndex == 1)
            Container(
              padding: EdgeInsets.all(40.r),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.gainsboro, width: 1),
              ),
              child: Center(
                child: Text(
                  AppStrings.auditLogs,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, int index, int current, VoidCallback onTap) {
    final isSelected = current == index;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.charcoalBlack : AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.charcoalBlack : AppColors.gainsboro,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.font14BlackRegular.copyWith(
            color: isSelected ? AppColors.white : AppColors.black,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
