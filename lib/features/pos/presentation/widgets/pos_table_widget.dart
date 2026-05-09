import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/pos_transaction_response.dart';
import '../../../../core/public_widgets/horizontal_scroll_table.dart';

class PosTableWidget extends StatelessWidget {
  final List<PosTransactionResponse> transactions;
  final ValueChanged<PosTransactionResponse> onRefund;
  final ValueChanged<PosTransactionResponse> onReceipt;

  const PosTableWidget({
    super.key,
    required this.transactions,
    required this.onRefund,
    required this.onReceipt,
  });

  @override
  Widget build(BuildContext context) {
    final table = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${AppStrings.posTransactions} (${transactions.length})',
          style: AppTextStyles.font16BlackSemiBold,
        ),
        verticalSpace(16),
        _buildHeaderRow(),
        Divider(color: AppColors.gainsboro, height: 1),
        ...transactions.asMap().entries.map((e) => _buildDataRow(e.value, e.key)),
      ],
    );

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: HorizontalScrollTable(
        minWidth: 900,
        child: table,
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              AppStrings.receiptNumber,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.totalAmount,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.date,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.status,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              AppStrings.actions,
              style: AppTextStyles.font13GreyRegular,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(PosTransactionResponse item, int index) {
    final isRefunded = (item.status ?? '').toLowerCase() == 'refunded';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
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
              item.receiptNumber ?? '-',
              style: AppTextStyles.font13BlackMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '\$${item.totalAmount ?? '0.00'}',
              style: AppTextStyles.font13BlackMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              item.createdAt != null 
                  ? item.createdAt!.split('T').first 
                  : '-',
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isRefunded
                      ? AppColors.brightRed.withValues(alpha: 0.1)
                      : AppColors.emerald.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  item.status ?? AppStrings.completed,
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: isRefunded ? AppColors.brightRed : AppColors.emerald,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => onReceipt(item),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Icon(
                    Icons.receipt_long_outlined,
                    size: 20.sp,
                    color: AppColors.skyBlue,
                  ),
                ),
                if (!isRefunded)
                  InkWell(
                    onTap: () => onRefund(item),
                    borderRadius: BorderRadius.circular(4.r),
                    child: Icon(
                      Icons.settings_backup_restore,
                      size: 20.sp,
                      color: AppColors.brightRed,
                    ),
                  )
                else
                  SizedBox(width: 20.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
