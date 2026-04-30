import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/compare_available_offer_item.dart';

class AvailableOffersWidget extends StatelessWidget {
  final List<CompareAvailableOfferItem> offers;
  final Set<int> selectedOfferIds;
  final ValueChanged<int> onToggle;

  const AvailableOffersWidget({
    super.key,
    required this.offers,
    required this.selectedOfferIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.availableOffers,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),
          if (offers.isEmpty)
            Text(
              AppStrings.noAvailableOffers,
              style: AppTextStyles.font13GreyRegular,
            ),
          ...offers.map(_buildOfferCard),
        ],
      ),
    );
  }

  Widget _buildOfferCard(CompareAvailableOfferItem offer) {
    final offerId = offer.id;
    final isSelected = offerId != null && selectedOfferIds.contains(offerId);

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: offerId == null ? null : () => onToggle(offerId),
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.skyBlue.withValues(alpha: 0.04)
                : AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: isSelected
                  ? AppColors.skyBlue.withValues(alpha: 0.3)
                  : AppColors.gainsboro,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Checkbox
              Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.skyBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: isSelected ? AppColors.skyBlue : AppColors.gainsboro,
                    width: 1.5,
                  ),
                ),
                child: isSelected
                    ? Icon(Icons.check, size: 14.sp, color: AppColors.white)
                    : null,
              ),
              horizontalSpace(16),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.originalFilename ?? '-',
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      '${AppStrings.warehouse}: ${_warehouseLabel(offer.wareHouseName)}  •  '
                      '${AppStrings.items}: ${offer.itemsCount ?? 0}  •  '
                      '${AppStrings.date}: ${_formatDate(offer.createdAt)}',
                      style: AppTextStyles.font12GreyRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    final local = date.toLocal();
    final year = local.year.toString().padLeft(4, '0');
    final month = local.month.toString().padLeft(2, '0');
    final day = local.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  String _warehouseLabel(String? warehouseName) {
    final value = warehouseName?.trim();
    if (value == null || value.isEmpty) {
      return AppStrings.unassigned;
    }
    return value;
  }
}
