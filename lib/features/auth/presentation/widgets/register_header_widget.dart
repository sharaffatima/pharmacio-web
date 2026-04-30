import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.registerAdminTitle, style: AppTextStyles.font22IndigoNightBold),
        verticalSpace(6),
        Text(
          AppStrings.registerAdminSubtitle,
          style: AppTextStyles.font14CoolGreyRegular,
        ),
      ],
    );
  }
}
