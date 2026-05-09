import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/pos_transaction_response.dart';
import '../../logic/cubit/pos_cubit.dart';
import '../widgets/pos_checkout_dialog.dart';
import '../widgets/pos_receipt_dialog.dart';
import '../widgets/pos_table_widget.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PosCubit>().fetchInventoryItems();
    context.read<PosCubit>().loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 6,
      title: AppStrings.posManagement,
      body: BlocConsumer<PosCubit, PosState>(
        listener: (context, state) {
          state.whenOrNull(
            successCheckout: (transaction) {
              showAppSnackBar(context, AppStrings.checkoutSuccess);
            },
            successGetReceipt: (receipt) {
              _showReceiptDialog(context, receipt);
            },
            successRefund: (transaction) {
              showAppSnackBar(context, AppStrings.refundSuccess);
            },
            error: (error) => showAppSnackBar(context, error),
          );
        },
        builder: (context, state) {
          final cubit = context.read<PosCubit>();
          final isLoading = state is PosLoading || state is PosInitial;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                verticalSpace(24),
                if (isLoading && cubit.transactions.isEmpty)
                  const LoadingWidget()
                else if (state is PosError && cubit.transactions.isEmpty)
                  RetryButtonWidget(
                    message: state.error,
                    onRetry: () => cubit.loadTransactions(),
                  )
                else
                  PosTableWidget(
                    transactions: cubit.transactions,
                    onRefund: (item) => _handleRefund(context, item),
                    onReceipt: (item) => _handleReceipt(context, item),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.posManagement,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.charcoalBlack,
          ),
        ),
        verticalSpace(4),
        Text(
          AppStrings.posSubtitle,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 12.sp, color: AppColors.coolGrey),
        ),
      ],
    );

    final checkoutButton = ElevatedButton.icon(
      onPressed: () => _showCheckoutDialog(context),
      icon: Icon(Icons.add_shopping_cart, size: 18.sp),
      label: Text(AppStrings.newCheckout),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.charcoalBlack,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 460) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              verticalSpace(12),
              Align(alignment: Alignment.centerLeft, child: checkoutButton),
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: title),
            horizontalSpace(16),
            checkoutButton,
          ],
        );
      },
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<PosCubit>(),
        child: const PosCheckoutDialog(),
      ),
    );
  }

  void _showReceiptDialog(BuildContext context, PosTransactionResponse item) {
    showDialog(
      context: context,
      builder: (ctx) => PosReceiptDialog(transaction: item),
    );
  }

  void _handleReceipt(BuildContext context, PosTransactionResponse item) {
    if (item.id == null) {
      showAppSnackBar(context, AppStrings.missingTransactionId);
      return;
    }
    context.read<PosCubit>().getReceipt(item.id!);
  }

  void _handleRefund(BuildContext context, PosTransactionResponse item) {
    if (item.id == null) {
      showAppSnackBar(context, AppStrings.missingTransactionId);
      return;
    }
    context.read<PosCubit>().refund(item.id!);
  }
}
