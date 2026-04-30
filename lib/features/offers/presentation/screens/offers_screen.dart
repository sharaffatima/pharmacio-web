import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../data/models/available_offer_item.dart';
import '../../logic/cubit/offers_cubit.dart';
import '../widgets/offers_filters_widget.dart';
import '../widgets/offers_header_widget.dart';
import '../widgets/offers_table_widget.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 2,
      body: BlocBuilder<OffersCubit, OffersState>(
        builder: (context, state) {
          return state.when(
            initial: () => const LoadingWidget(),
            loading: () => const LoadingWidget(),
            error: (error) => RetryButtonWidget(
              message: error,
              onRetry: () => context.read<OffersCubit>().loadData(),
            ),
            successGetAvailableOffers: (offers) =>
                _buildContent(context, offers),
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<AvailableOfferItem> offers) {
    final cubit = context.read<OffersCubit>();
    final suppliers = _buildStatusFilters(offers);
    final warehouses = _buildWarehouseFilters(offers);
    final isMobile = AppResponsive.isMobile(context);
    final hPad = isMobile ? 16.w : 32.w;
    final vPad = isMobile ? 16.h : 28.h;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
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
            onSearchChanged: cubit.updateSearch,
            selectedSupplier: cubit.selectedSupplier,
            selectedWarehouse: cubit.selectedWarehouse,
            suppliers: suppliers,
            warehouses: warehouses,
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

  List<String> _buildStatusFilters(List<AvailableOfferItem> offers) {
    final statuses =
        offers
            .map(
              (offer) => (offer.status ?? '').toLowerCase() == 'completed'
                  ? AppStrings.completed
                  : (offer.status ?? AppStrings.unknown),
            )
            .toSet()
            .toList()
          ..sort();

    return [AppStrings.allSuppliers, ...statuses];
  }

  List<String> _buildWarehouseFilters(List<AvailableOfferItem> offers) {
    final warehouses =
        offers
            .map((offer) => _warehouseLabel(offer.wareHouseName))
            .toSet()
            .toList()
          ..sort();

    return [AppStrings.allWarehouses, ...warehouses];
  }

  String _warehouseLabel(String? warehouseName) {
    final value = warehouseName?.trim();
    if (value == null || value.isEmpty) {
      return AppStrings.unassigned;
    }
    return value;
  }
}
