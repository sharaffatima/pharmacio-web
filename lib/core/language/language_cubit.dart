import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_strings.dart';
import '../constants/shared_pref_keys.dart';
import '../helpers/app_shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super(_loadInitialLanguage()) {
    AppStrings.currentLanguage = state;
  }

  static String _loadInitialLanguage() {
    return AppSharedPreferences().getString(AppSharedPrefKeys.language) ?? 'en';
  }

  void toggleLanguage() {
    final newLang = state == 'en' ? 'ar' : 'en';
    AppStrings.currentLanguage = newLang;
    AppSharedPreferences().setString(AppSharedPrefKeys.language, newLang);
    emit(newLang);
  }
}
