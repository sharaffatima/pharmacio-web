import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/input_validation_type.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/button_widget.dart';
import '../../../../core/public_widgets/text_field_widget.dart';
import '../../logic/cubits/auth_cubit.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

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
            controller: cubit.usernameController,
            hintText: AppStrings.usernameHint,
            labelText: '',
            obscureText: false,
            keyboardType: TextInputType.text,
            validationType: InputValidationType.username,
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
          verticalSpace(16),

          Text(
            AppStrings.confirmPassword,
            style: AppTextStyles.font14CharcoalBlackSemiBold,
          ),
          verticalSpace(8),
          TextFieldWidget(
            controller: cubit.confirmPasswordController,
            hintText: AppStrings.confirmPasswordHint,
            labelText: '',
            obscureText: true,
            validationType: InputValidationType.password,
          ),
          verticalSpace(24),

          ButtonWidget(
            title: AppStrings.registerButton,
            onTap: () => cubit.register(),
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
