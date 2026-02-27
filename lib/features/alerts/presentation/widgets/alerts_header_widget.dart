import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class AlertsHeaderWidget extends StatelessWidget {
  const AlertsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.alertsCenter, style: AppTextStyles.font24BlackBold),
        verticalSpace(4),
        Text(AppStrings.alertsSubtitle, style: AppTextStyles.font13GreyRegular),
      ],
    );
  }
}
