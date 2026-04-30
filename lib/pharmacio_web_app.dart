import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/constants/colors.dart';
import 'core/language/language_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/theme_cubit.dart';

class PharmacioWebApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isAuthenticated;

  const PharmacioWebApp({
    super.key,
    required this.appRouter,
    this.isAuthenticated = false,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: isAuthenticated
              ? Routes.dashboardScreen
              : Routes.loginScreen,
          theme: ThemeData(
            primaryColor: AppColors.forestGreen,
            scaffoldBackgroundColor: AppColors.white,
          ),
          builder: (context, child) {
            return BlocBuilder<LanguageCubit, String>(
              builder: (context, lang) {
                return BlocBuilder<ThemeCubit, bool>(
                  builder: (context, isDark) {
                    return Directionality(
                      textDirection: lang == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: child!,
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
