import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../dashboard/presentation/widgets/sidebar_widget.dart';
import '../../logic/cubit/offers_cubit.dart';
import '../widgets/offers_filters_widget.dart';
import '../widgets/offers_header_widget.dart';
import '../widgets/offers_table_widget.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  static final _suppliers = [
    'All Suppliers',
    'Supplier A',
    'Supplier B',
    'Supplier C',
    'Supplier D',
  ];
  static final _warehouses = [
    'All Warehouses',
    'Warehouse 1',
    'Warehouse 2',
    'Warehouse 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhiteGrey,
      body: Row(
        children: [
          const SidebarWidget(selectedIndex: 2),
          Expanded(
            child: BlocBuilder<OffersCubit, OffersState>(
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

  Widget _buildContent(BuildContext context, List<OfferEntry> offers) {
    final cubit = context.read<OffersCubit>();
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OffersHeaderWidget(),
          verticalSpace(24),
          OffersFiltersWidget(
            searchController: TextEditingController(text: cubit.searchQuery)
              ..selection = TextSelection.collapsed(
                offset: cubit.searchQuery.length,
              ),
            selectedSupplier: cubit.selectedSupplier,
            selectedWarehouse: cubit.selectedWarehouse,
            suppliers: _suppliers,
            warehouses: _warehouses,
            onSupplierChanged: cubit.updateSupplier,
            onWarehouseChanged: cubit.updateWarehouse,
            onClearFilters: cubit.clearFilters,
          ),
          verticalSpace(24),
          OffersTableWidget(
            entries: offers,
            sortColumnIndex: cubit.sortColumnIndex,
            sortAscending: cubit.sortAscending,
            onSort: cubit.sort,
            onView: (i) {},
          ),
        ],
      ),
    );
  }
}
