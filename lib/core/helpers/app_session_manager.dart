import 'package:flutter/material.dart';

import '../constants/app_strings.dart';
import '../constants/shared_pref_keys.dart';
import '../routing/routes.dart';
import 'app_shared_preferences.dart';
import 'jwt_helper.dart';

enum SessionStatus { authenticated, missing, expired, invalid }

class SessionBootstrapResult {
  final String initialRoute;
  final bool showExpiredMessage;

  const SessionBootstrapResult({
    required this.initialRoute,
    required this.showExpiredMessage,
  });
}

class AppSessionManager {
  AppSessionManager._internal();

  static final AppSessionManager _instance = AppSessionManager._internal();

  factory AppSessionManager() => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  String? get accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken);

  String? get refreshToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  SessionStatus get sessionStatus {
    final token = accessToken;
    if (token == null || token.isEmpty) {
      return SessionStatus.missing;
    }

    if (JwtHelper.isExpired(token)) {
      return SessionStatus.expired;
    }

    return SessionStatus.authenticated;
  }

  bool get hasValidSession => sessionStatus == SessionStatus.authenticated;

  Future<SessionBootstrapResult> bootstrap() async {
    final status = sessionStatus;
    if (status == SessionStatus.authenticated) {
      return const SessionBootstrapResult(
        initialRoute: Routes.dashboardScreen,
        showExpiredMessage: false,
      );
    }

    if (status == SessionStatus.expired) {
      await clearSession();
      return const SessionBootstrapResult(
        initialRoute: Routes.loginScreen,
        showExpiredMessage: true,
      );
    }

    return const SessionBootstrapResult(
      initialRoute: Routes.loginScreen,
      showExpiredMessage: false,
    );
  }

  Future<void> clearSession() async {
    final prefs = AppSharedPreferences();
    await prefs.removeKey(AppSharedPrefKeys.accessToken);
    await prefs.removeKey(AppSharedPrefKeys.refreshToken);
  }

  Future<void> handleSessionExpired({String? message}) async {
    await clearSession();
    _showSnackBar(message ?? AppStrings.sessionExpired);
    _navigateToLogin();
  }

  void showSessionExpiredMessage({String? message}) {
    _showSnackBar(message ?? AppStrings.sessionExpired);
  }

  void _showSnackBar(String message) {
    final messenger = messengerKey.currentState;
    if (messenger == null) {
      return;
    }

    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _navigateToLogin() {
    final navigator = navigatorKey.currentState;
    if (navigator == null) {
      return;
    }

    navigator.pushNamedAndRemoveUntil(Routes.loginScreen, (route) => false);
  }
}
