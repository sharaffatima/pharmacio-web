import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/app_responsive.dart';
import '../../../../core/helpers/extentions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubits/auth_cubit.dart';
import '../widgets/register_form_widget.dart';
import '../widgets/register_header_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: -1,
      body: BlocListener<AuthCubit, AuthState>(
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
        child: Builder(
          builder: (context) {
            final isMobile = AppResponsive.isMobile(context);
            final hPad = isMobile ? 16.w : 32.w;
            final vPad = isMobile ? 16.h : 28.h;
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: hPad,
                vertical: vPad,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackBar(context),
                  verticalSpace(24),
                  Center(
                    child: Container(
                      width: isMobile
                          ? double.infinity
                          : 440.w,
                      constraints: BoxConstraints(maxWidth: 440.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.w,
                        vertical: 36.h,
                      ),
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
                                loading: () =>
                                    const Center(child: LoadingWidget()),
                                orElse: () => const RegisterFormWidget(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(40),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackBar(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (Navigator.of(context).canPop()) {
              context.pop();
            } else {
              context.pushReplacementNamed(Routes.dashboardScreen);
            }
          },
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.gainsboro),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 18.sp,
                  color: AppColors.charcoalBlack,
                ),
                horizontalSpace(8),
                Text(
                  AppStrings.backToDashboard,
                  style: AppTextStyles.font13BlackMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
