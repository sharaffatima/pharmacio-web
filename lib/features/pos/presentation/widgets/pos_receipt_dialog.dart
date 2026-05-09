import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:printing/printing.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/pdf_generator.dart';
import '../../data/models/pos_transaction_response.dart';

class PosReceiptDialog extends StatelessWidget {
  final PosTransactionResponse transaction;

  const PosReceiptDialog({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        width: 400.w,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.receipt,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
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
            _buildReceiptRow(
              AppStrings.receiptNumber,
              transaction.receiptNumber ?? '-',
            ),
            _buildReceiptRow(
              AppStrings.date,
              transaction.createdAt != null
                  ? transaction.createdAt!.split('T').first
                  : '-',
            ),
            _buildReceiptRow(AppStrings.status, transaction.status ?? '-'),
            verticalSpace(12),
            Divider(color: AppColors.gainsboro),
            verticalSpace(12),
            Text(
              AppStrings.inventoryItems,
              style: AppTextStyles.font14BlackRegular.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(8),
            if (transaction.items != null && transaction.items!.isNotEmpty)
              ...transaction.items!.map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.quantity}x ${item.productName}',
                        style: AppTextStyles.font13GreyRegular,
                      ),
                      Text(
                        '\$${item.totalPrice}',
                        style: AppTextStyles.font13BlackMedium,
                      ),
                    ],
                  ),
                ),
              )
            else
              Text(
                AppStrings.noItemsFound,
                style: AppTextStyles.font12GreyRegular,
              ),
            verticalSpace(12),
            Divider(color: AppColors.gainsboro),
            verticalSpace(12),
            Text(
              AppStrings.payments,
              style: AppTextStyles.font14BlackRegular.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(8),
            if (transaction.payments != null &&
                transaction.payments!.isNotEmpty)
              ...transaction.payments!.map(
                (payment) => Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        payment.paymentMethod ?? '-',
                        style: AppTextStyles.font13GreyRegular,
                      ),
                      Text(
                        '\$${payment.amountPaid ?? '0.00'}',
                        style: AppTextStyles.font13BlackMedium,
                      ),
                    ],
                  ),
                ),
              )
            else
              Text(
                AppStrings.noItemsFound,
                style: AppTextStyles.font12GreyRegular,
              ),
            verticalSpace(12),
            Divider(color: AppColors.gainsboro),
            verticalSpace(12),
            _buildReceiptRow(
              AppStrings.subtotal,
              '\$${transaction.subtotal ?? '0.00'}',
            ),
            _buildReceiptRow(
              AppStrings.discount,
              '${transaction.discountPercentage ?? '0.00'}%',
            ),
            verticalSpace(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.totalAmount,
                  style: AppTextStyles.font16BlackSemiBold,
                ),
                Text(
                  '\$${transaction.totalAmount ?? '0.00'}',
                  style: AppTextStyles.font16BlackSemiBold.copyWith(
                    color: AppColors.skyBlue,
                  ),
                ),
              ],
            ),
            verticalSpace(24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => _printReceipt(),
                icon: Icon(Icons.print, size: 16.sp),
                label: Text(AppStrings.printReceipt),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.charcoalBlack,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.font13GreyRegular),
          Text(value, style: AppTextStyles.font13BlackMedium),
        ],
      ),
    );
  }

  Future<void> _printReceipt() async {
    await Printing.layoutPdf(
      name:
          'Receipt_${transaction.receiptNumber ?? transaction.id ?? 'Unknown'}.pdf',
      onLayout: (_) => PdfGenerator.generateReceiptPdf(transaction),
    );
  }
}
