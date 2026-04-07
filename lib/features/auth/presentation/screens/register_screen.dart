import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../logic/cubits/auth_cubit.dart';
import '../widgets/register_form_widget.dart';
import '../widgets/register_header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: Center(
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                showAppSnackBar(context, error);
              },
              successRegister: (response) {
                final username = response.user?.username ?? '-';
                showAppSnackBar(
                  context,
                  '${AppStrings.registerSuccess}: $username',
                );
                context.read<AuthCubit>()
                  ..usernameController.clear()
                  ..passwordController.clear()
                  ..confirmPasswordController.clear();
              },
            );
          },
          child: Container(
            width: 440.w,
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 36.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RegisterHeaderWidget(),
                verticalSpace(28),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: LoadingWidget()),
                      orElse: () => const RegisterFormWidget(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
