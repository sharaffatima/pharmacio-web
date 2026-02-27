import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

/// Model for a comparable offer.
class CompareOfferItem {
  final String name;
  final String supplier;
  final int items;
  final String date;
  bool isSelected;

  CompareOfferItem({
    required this.name,
    required this.supplier,
    required this.items,
    required this.date,
    this.isSelected = false,
  });

  static List<CompareOfferItem> sampleData() => [
    CompareOfferItem(
      name: 'Q1 2026 Supplier A Offers',
      supplier: 'Supplier A',
      items: 245,
      date: '2026-02-11',
    ),
    CompareOfferItem(
      name: 'February Price List',
      supplier: 'Supplier B',
      items: 189,
      date: '2026-02-10',
    ),
    CompareOfferItem(
      name: 'Vendor C Special Offers',
      supplier: 'Supplier C',
      items: 156,
      date: '2026-02-09',
    ),
    CompareOfferItem(
      name: 'Bulk Purchase Deals',
      supplier: 'Supplier B',
      items: 321,
      date: '2026-02-08',
    ),
    CompareOfferItem(
      name: 'Seasonal Products',
      supplier: 'Supplier D',
      items: 203,
      date: '2026-02-07',
    ),
  ];
}

class AvailableOffersWidget extends StatelessWidget {
  final List<CompareOfferItem> offers;
  final ValueChanged<int> onToggle;

  const AvailableOffersWidget({
    super.key,
    required this.offers,
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
          ...offers.asMap().entries.map((e) => _buildOfferCard(e.value, e.key)),
        ],
      ),
    );
  }

  Widget _buildOfferCard(CompareOfferItem offer, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        onTap: () => onToggle(index),
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: offer.isSelected
                ? AppColors.skyBlue.withValues(alpha: 0.04)
                : AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: offer.isSelected
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
                  color: offer.isSelected ? AppColors.skyBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    color: offer.isSelected
                        ? AppColors.skyBlue
                        : AppColors.gainsboro,
                    width: 1.5,
                  ),
                ),
                child: offer.isSelected
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
                      offer.name,
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      '${AppStrings.supplier}: ${offer.supplier}  •  '
                      '${AppStrings.items}: ${offer.items}  •  '
                      '${AppStrings.date}: ${offer.date}',
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
}
