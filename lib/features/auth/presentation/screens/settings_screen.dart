import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/public_widgets/loading_widget.dart';
import '../../logic/cubits/auth_cubit.dart';
import '../widgets/change_password_form_widget.dart';
import '../widgets/settings_header_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          successChangePassword: (response) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(AppStrings.passwordChangedSuccess),
                backgroundColor: Colors.green,
              ),
            );
            cubit.oldPasswordController.clear();
            cubit.newPasswordController.clear();
            cubit.confirmNewPasswordController.clear();
          },
          error: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            );
          },
        );
      },
      builder: (context, state) {
        final me = state.whenOrNull(successGetMe: (me) => me);
        final isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return Scaffold(
          backgroundColor: AppColors.offWhiteGrey,
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SettingsHeaderWidget(me: me),
                    verticalSpace(32),
                    Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 480.w),
                        child: const ChangePasswordFormWidget(),
                      ),
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
              if (isLoading)
                Container(
                  color: AppColors.white.withValues(alpha: 0.6),
                  child: const Center(child: LoadingWidget()),
                ),
            ],
          ),
        );
      },
    );
  }
}
