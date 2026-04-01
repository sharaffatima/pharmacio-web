import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/rbac_remote_data_source.dart';
import '../models/permission_model.dart';
import '../models/role_model.dart';

class RbacRepo {
  final RbacRemoteDataSource rbacRemoteDataSource;
  final NetworkInfo networkInfo;

  RbacRepo({required this.rbacRemoteDataSource, required this.networkInfo});

  Future<bool> checkPermission({
    int? userId,
    int? roleId,
    required String permission,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.checkPermission(
          userId: userId,
          roleId: roleId,
          permission: permission,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<PermissionModel>> getPermissions() async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getPermissions();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PermissionModel> getPermissionById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getPermissionById(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<RoleModel>> getRoles() async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getRoles();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<RoleModel> getRoleById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getRoleById(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<PermissionModel>> getRolePermissions(int roleId) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getRolePermissions(roleId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<RoleModel>> getUserRoles(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.getUserRoles(userId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<void> removeUserRole(int userId, int roleId) async {
    if (await networkInfo.isConnected) {
      try {
        return await rbacRemoteDataSource.removeUserRole(userId, roleId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
