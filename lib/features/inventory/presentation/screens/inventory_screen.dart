import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../logic/cubit/inventory_cubit.dart';
import '../widgets/inventory_header_widget.dart';
import '../widgets/inventory_stat_cards_widget.dart';
import '../widgets/inventory_table_widget.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 5),
          Expanded(
            child: BlocBuilder<InventoryCubit, InventoryState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const LoadingWidget(),
                  loading: () => const LoadingWidget(),
                  error: (error) => Center(child: Text(error)),
                  success: (items) => _buildContent(context, items),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<InventoryItem> items) {
    final cubit = context.read<InventoryCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InventoryHeaderWidget(),
          verticalSpace(24),

          InventoryStatCardsWidget(
            totalItems: cubit.totalCount,
            lowStockItems: cubit.lowStockCount,
            totalStockValue: cubit.totalStockValue,
          ),
          verticalSpace(24),

          // ─── Search & Filter ──────────────────
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
                  AppStrings.searchAndFilter,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                verticalSpace(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.offWhiteGrey,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: TextField(
                          controller:
                              TextEditingController(text: cubit.searchQuery)
                                ..selection = TextSelection.collapsed(
                                  offset: cubit.searchQuery.length,
                                ),
                          onChanged: cubit.updateSearch,
                          style: AppTextStyles.font14BlackRegular,
                          decoration: InputDecoration(
                            hintText: AppStrings.searchByProduct,
                            hintStyle: AppTextStyles.font13GreyRegular,
                            prefixIcon: Icon(
                              Icons.search,
                              size: 20.sp,
                              color: AppColors.coolGrey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    OutlinedButton.icon(
                      onPressed: cubit.toggleLowStock,
                      icon: Icon(
                        Icons.warning_amber,
                        size: 16.sp,
                        color: cubit.lowStockOnly
                            ? AppColors.brightRed
                            : AppColors.coolGrey,
                      ),
                      label: Text(
                        AppStrings.lowStockOnly,
                        style: AppTextStyles.font14BlackRegular,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: cubit.lowStockOnly
                              ? AppColors.brightRed
                              : AppColors.gainsboro,
                        ),
                        backgroundColor: cubit.lowStockOnly
                            ? AppColors.brightRed.withValues(alpha: 0.05)
                            : AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(24),

          InventoryTableWidget(entries: items, onEdit: (i) {}),
        ],
      ),
    );
  }
}
