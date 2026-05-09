import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/constants/colors.dart';
import 'core/helpers/app_session_manager.dart';
import 'core/language/language_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/theme/theme_cubit.dart';

class PharmacioWebApp extends StatefulWidget {
  final AppRouter appRouter;
  final String initialRoute;
  final bool showSessionExpiredOnStart;

  const PharmacioWebApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
    required this.showSessionExpiredOnStart,
  });

  @override
  State<PharmacioWebApp> createState() => _PharmacioWebAppState();
}

class _PharmacioWebAppState extends State<PharmacioWebApp> {
  @override
  void initState() {
    super.initState();
    if (widget.showSessionExpiredOnStart) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSessionManager().showSessionExpiredMessage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sessionManager = AppSessionManager();
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 900;
        return ScreenUtilInit(
          designSize: isMobile ? const Size(390, 844) : const Size(1440, 900),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appTitle,
              onGenerateRoute: widget.appRouter.generateRoute,
              initialRoute: widget.initialRoute,
              navigatorKey: sessionManager.navigatorKey,
              scaffoldMessengerKey: sessionManager.messengerKey,
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
      },
    );
  }
}
