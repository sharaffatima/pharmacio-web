import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/permission_model.dart';
import '../models/role_model.dart';

abstract class RbacRemoteDataSource {
  Future<bool> checkPermission({
    int? userId,
    int? roleId,
    required String permission,
  });
  Future<List<PermissionModel>> getPermissions();
  Future<PermissionModel> getPermissionById(int id);
  Future<List<RoleModel>> getRoles();
  Future<RoleModel> getRoleById(int id);
  Future<List<PermissionModel>> getRolePermissions(int roleId);
  Future<List<RoleModel>> getUserRoles(int userId);
  Future<void> removeUserRole(int userId, int roleId);
}

class RbacRemoteDataSourceImp implements RbacRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  RbacRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<bool> checkPermission({
    int? userId,
    int? roleId,
    required String permission,
  }) async {
    try {
      final response = await apiServicesImpl.post(
        AppLinkUrl.permissionsCheck,
        body: {
          if (userId != null) 'user_id': userId,
          if (roleId != null) 'role_id': roleId,
          'permission': permission,
        },
        token: _accessToken,
      );

      if (response is Map<String, dynamic> && response.containsKey('allowed')) {
        return response['allowed'] as bool;
      }
      return false;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<PermissionModel>> getPermissions() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacPermissions,
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PermissionModel> getPermissionById(int id) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacPermissionDetail(id),
        token: _accessToken,
      );
      return PermissionModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<RoleModel>> getRoles() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacRoles,
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<RoleModel> getRoleById(int id) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacRoleDetail(id),
        token: _accessToken,
      );
      return RoleModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<PermissionModel>> getRolePermissions(int roleId) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacRolePermissions(roleId),
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<RoleModel>> getUserRoles(int userId) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.rbacUserRoles(userId),
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => RoleModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<void> removeUserRole(int userId, int roleId) async {
    try {
      await apiServicesImpl.delete(
        AppLinkUrl.rbacRemoveUserRole(userId, roleId),
        token: _accessToken,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
