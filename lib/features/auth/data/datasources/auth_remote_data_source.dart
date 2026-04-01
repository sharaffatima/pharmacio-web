import 'package:dio/dio.dart';
import 'package:pharmacio_flutter_web/core/helpers/app_shared_preferences.dart';
import 'package:pharmacio_flutter_web/core/networking/app_link_url.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/change_password/change_password_request_body.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/change_password/change_password_response.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/login/login_request_body.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/login/login_response.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/logout/logout_response.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/me/me_response.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/register/register_request_body.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/register/register_response.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginRequestBody loginRequestBody);
  Future<RegisterResponse> register(RegisterRequestBody registerRequestBody);
  Future<LogoutResponse> logout();
  Future<MeResponse> getMe();
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequestBody requestBody,
  );
  Future<RegisterResponse> adminRegister(RegisterRequestBody registerRequestBody);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  AuthRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<LoginResponse> login(LoginRequestBody loginRequestBody) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.login,
        body: {
          'username': loginRequestBody.username,
          'password': loginRequestBody.password,
        },
      );
      final response = LoginResponse.fromJson(request);
      final sharedPref = AppSharedPreferences();
      await sharedPref.setString(
        AppSharedPrefKeys.accessToken,
        response.token.access,
      );
      await sharedPref.setString(
        AppSharedPrefKeys.refreshToken,
        response.token.refresh,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<RegisterResponse> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.register,
        body: {
          'username': registerRequestBody.username,
          'password': registerRequestBody.password,
          'password2': registerRequestBody.confirmPassword,
        },
        token: _accessToken,
      );
      return RegisterResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<RegisterResponse> adminRegister(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.adminRegister,
        body: {
          'username': registerRequestBody.username,
          'password': registerRequestBody.password,
          'password2': registerRequestBody.confirmPassword,
        },
        token: _accessToken,
      );
      // Admin register returns {user, token (singular), message}
      // Regular register returns {user, tokens (plural), message}
      // Normalize 'token' → 'tokens' so RegisterResponse.fromJson works
      final normalized = Map<String, dynamic>.from(request as Map<String, dynamic>);
      if (normalized.containsKey('token') && !normalized.containsKey('tokens')) {
        normalized['tokens'] = normalized['token'];
      }
      return RegisterResponse.fromJson(normalized);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<LogoutResponse> logout() async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.logout,
        token: _accessToken,
      );
      final response = LogoutResponse.fromJson(request);
      final sharedPref = AppSharedPreferences();
      await sharedPref.removeKey(AppSharedPrefKeys.accessToken);
      await sharedPref.removeKey(AppSharedPrefKeys.refreshToken);
      return response;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<MeResponse> getMe() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.me,
        token: _accessToken,
      );
      return MeResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.changePassword,
        body: {
          'old_password': requestBody.oldPassword,
          'new_password': requestBody.newPassword,
          'confirme_password': requestBody.confirmPassword,
        },
        token: _accessToken,
      );
      final response = ChangePasswordResponse.fromJson(request);
      final sharedPref = AppSharedPreferences();
      await sharedPref.setString(
        AppSharedPrefKeys.accessToken,
        response.tokens.access,
      );
      await sharedPref.setString(
        AppSharedPrefKeys.refreshToken,
        response.tokens.refresh,
      );
      return response;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
