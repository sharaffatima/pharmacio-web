import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: () => context.pushNamedAndRemoveUntil(
            Routes.dashboardScreen,
            predicate: (route) => false,
          ),
          icon: Icon(Icons.arrow_back, size: 18, color: AppColors.coolGrey),
          label: Text(
            AppStrings.backToDashboard,
            style: AppTextStyles.font13GreyRegular,
          ),
        ),
        verticalSpace(8),
        Text(
          AppStrings.registerAdminTitle,
          style: AppTextStyles.font22IndigoNightBold,
        ),
        verticalSpace(6),
        Text(
          AppStrings.registerAdminSubtitle,
          style: AppTextStyles.font14CoolGreyRegular,
        ),
      ],
    );
  }
}
