import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/compare_offer_result_model.dart';

class CompareResultsWidget extends StatelessWidget {
  final List<CompareOfferResultModel> results;

  const CompareResultsWidget({super.key, required this.results});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.compareResults,
                style: AppTextStyles.font16BlackSemiBold,
              ),
              Text(
                '${results.length} ${AppStrings.items}',
                style: AppTextStyles.font12GreyRegular,
              ),
            ],
          ),
          verticalSpace(16),
          if (results.isEmpty)
            Text(
              AppStrings.noComparedResults,
              style: AppTextStyles.font13GreyRegular,
            ),
          if (results.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: results.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: AppColors.gainsboro),
              itemBuilder: (_, index) => _buildResultRow(results[index]),
            ),
        ],
      ),
    );
  }

  Widget _buildResultRow(CompareOfferResultModel result) {
    final best = result.best;
    final alternativesCount = result.alternatives?.length ?? 0;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.drugName ?? '-',
                  style: AppTextStyles.font14BlackRegular.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpace(3),
                Text(
                  result.company?.isEmpty ?? true
                      ? '-'
                      : (result.company ?? '-'),
                  style: AppTextStyles.font12GreyRegular,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              best?.price ?? '-',
              style: AppTextStyles.font13BlackMedium,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              best?.wareHouseName ?? '-',
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            child: Text(
              alternativesCount.toString(),
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
        ],
      ),
    );
  }
}
