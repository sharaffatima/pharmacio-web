import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.adminLogin, style: AppTextStyles.font22IndigoNightBold),
        verticalSpace(6),
        Text(
          AppStrings.signInSubtitle,
          style: AppTextStyles.font14CoolGreyRegular,
        ),
      ],
    );
  }
}
