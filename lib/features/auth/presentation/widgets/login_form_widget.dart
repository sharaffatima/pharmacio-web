import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/input_validation_type.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/button_widget.dart';
import '../../../../core/public_widgets/text_field_widget.dart';
import '../../logic/cubits/login_cubit.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.emailUsername,
            style: AppTextStyles.font14CharcoalBlackSemiBold,
          ),
          verticalSpace(8),
          TextFieldWidget(
            controller: cubit.emailController,
            hintText: AppStrings.emailHint,
            labelText: '',
            obscureText: false,
            keyboardType: TextInputType.emailAddress,
            validationType: InputValidationType.email,
          ),
          verticalSpace(16),

          Text(
            AppStrings.password,
            style: AppTextStyles.font14CharcoalBlackSemiBold,
          ),
          verticalSpace(8),
          TextFieldWidget(
            controller: cubit.passwordController,
            hintText: AppStrings.passwordHint,
            labelText: '',
            obscureText: true,
            validationType: InputValidationType.password,
          ),
          verticalSpace(24),

          ButtonWidget(
            title: AppStrings.signIn,
            onTap: () => cubit.login(),
            backgroundColor: AppColors.charcoalBlack,
            borderColor: AppColors.charcoalBlack,
            textStyle: AppTextStyles.font16WhiteMedium,
            width: double.infinity,
            height: 48,
            radius: 8,
          ),
        ],
      ),
    );
  }
}
