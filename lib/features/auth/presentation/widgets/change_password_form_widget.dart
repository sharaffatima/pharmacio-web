import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_web/core/helpers/extentions.dart';
import 'package:pharmacio_flutter_web/core/public_widgets/button_widget.dart';
import 'package:pharmacio_flutter_web/core/public_widgets/loading_widget.dart';
import 'package:pharmacio_flutter_web/core/routing/routes.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/text_styles.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/public_widgets/text_field_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../logic/cubits/auth_cubit.dart';

class ChangePasswordFormWidget extends StatefulWidget {
  const ChangePasswordFormWidget({super.key});

  @override
  State<ChangePasswordFormWidget> createState() =>
      _ChangePasswordFormWidgetState();
}

class _ChangePasswordFormWidgetState extends State<ChangePasswordFormWidget> {
  bool _hideOld = true;
  bool _hideNew = true;
  bool _hideConfirm = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.changePasswordTitle,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(20),

          TextFieldWidget(
            controller: cubit.oldPasswordController,
            hintText: AppStrings.oldPassword,
            labelText: AppStrings.oldPassword,
            obscureText: _hideOld,
            suffixIcon: _hideOld ? Icons.visibility_off : Icons.visibility,
            onPressedSuffixIcon: () => setState(() => _hideOld = !_hideOld),
          ),
          verticalSpace(16),

          TextFieldWidget(
            controller: cubit.newPasswordController,
            hintText: AppStrings.newPassword,
            labelText: AppStrings.newPassword,
            obscureText: _hideNew,
            suffixIcon: _hideNew ? Icons.visibility_off : Icons.visibility,
            onPressedSuffixIcon: () => setState(() => _hideNew = !_hideNew),
          ),
          verticalSpace(16),

          TextFieldWidget(
            controller: cubit.confirmNewPasswordController,
            hintText: AppStrings.confirmNewPassword,
            labelText: AppStrings.confirmNewPassword,
            obscureText: _hideConfirm,
            suffixIcon: _hideConfirm ? Icons.visibility_off : Icons.visibility,
            onPressedSuffixIcon: () =>
                setState(() => _hideConfirm = !_hideConfirm),
          ),
          verticalSpace(24),

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.whenOrNull(
                successChangePassword: (response) {
                  cubit.oldPasswordController.clear();
                  cubit.newPasswordController.clear();
                  cubit.confirmNewPasswordController.clear();
                  showAppSnackBar(
                    context,
                    response.message ??
                        (AppStrings.currentLanguage == 'ar'
                            ? 'تم تغيير كلمة المرور بنجاح'
                            : 'Password changed successfully'),
                  );
                  context.pushNamedAndRemoveUntil(
                    Routes.dashboardScreen,
                    predicate: (route) => false,
                  );
                },
                error: (msg) {
                  showAppSnackBar(context, msg);
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => LoadingWidget(),
                orElse: () => ButtonWidget(
                  title: AppStrings.changePasswordButton,
                  onTap: () => cubit.changePassword(),
                  backgroundColor: AppColors.skyBlue,
                  borderColor: AppColors.skyBlue,
                  textStyle: AppTextStyles.font16WhiteMedium,
                  width: double.infinity,
                  height: 48,
                  radius: 8,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
