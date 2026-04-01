import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/colors.dart';
import 'core/language/language_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/theme_cubit.dart';

class PharmacioWebApp extends StatelessWidget {
  final AppRouter appRouter;

  const PharmacioWebApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pharmacio Admin Panel',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.loginScreen,
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
