import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/constants/colors.dart';
import 'core/constants/shared_pref_keys.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/app_shared_preferences.dart';
import 'core/helpers/my_bloc_observer.dart';
import 'core/language/language_cubit.dart';
import 'core/theme/theme_cubit.dart';
import 'core/routing/app_router.dart';
import 'pharmacio_web_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetit();
  await ScreenUtil.ensureScreenSize();
  await AppSharedPreferences().init();
  Bloc.observer = MyBlocObserver();

  AppStrings.currentLanguage =
      AppSharedPreferences().getString(AppSharedPrefKeys.language) ?? 'en';
  AppColors.isDarkMode =
      AppSharedPreferences().getBool(AppSharedPrefKeys.theme) ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LanguageCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: PharmacioWebApp(appRouter: AppRouter()),
    ),
  );
}
