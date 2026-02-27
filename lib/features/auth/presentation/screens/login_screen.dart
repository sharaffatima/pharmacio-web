import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pharmacio_flutter_web/core/helpers/extentions.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../../../core/routing/routes.dart';
import '../../logic/cubits/login_cubit.dart';
import '../widgets/login_form_widget.dart';
import '../widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: Center(
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (error) {
                showAppSnackBar(context, error);
                context.pushReplacementNamed(Routes.dashboardScreen);
              },
              success: (response) {
                //! context.pushReplacementNamed(Routes.dashboardScreen);
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
                const LoginHeaderWidget(),
                verticalSpace(28),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const Center(child: LoadingWidget()),
                      orElse: () => const LoginFormWidget(),
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
