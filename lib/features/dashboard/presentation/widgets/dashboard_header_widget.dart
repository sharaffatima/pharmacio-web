import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class DashboardHeaderWidget extends StatelessWidget {
  const DashboardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.dashboard, style: AppTextStyles.font24BlackBold),
        verticalSpace(4),
        Text(
          AppStrings.dashboardSubtitle,
          style: AppTextStyles.font13GreyRegular,
        ),
      ],
    );
  }
}
