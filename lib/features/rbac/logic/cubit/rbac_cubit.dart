import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/permission_model.dart';
import '../../data/models/role_model.dart';
import '../../data/repos/rbac_repo.dart';

part '../states/rbac_state.dart';
part 'rbac_cubit.freezed.dart';

class RbacCubit extends Cubit<RbacState> {
  final RbacRepo _rbacRepo;

  RbacCubit(this._rbacRepo) : super(const RbacState.initial());

  Future<void> loadRoles() async {
    emit(const RbacState.loading());
    try {
      final roles = await _rbacRepo.getRoles();
      emit(RbacState.rolesLoaded(roles));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> loadRole(int id) async {
    emit(const RbacState.loading());
    try {
      final role = await _rbacRepo.getRoleById(id);
      emit(RbacState.roleLoaded(role));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> loadPermissions() async {
    emit(const RbacState.loading());
    try {
      final permissions = await _rbacRepo.getPermissions();
      emit(RbacState.permissionsLoaded(permissions));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> loadPermission(int id) async {
    emit(const RbacState.loading());
    try {
      final permission = await _rbacRepo.getPermissionById(id);
      emit(RbacState.permissionLoaded(permission));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> loadUserRoles(int userId) async {
    emit(const RbacState.loading());
    try {
      final roles = await _rbacRepo.getUserRoles(userId);
      emit(RbacState.userRolesLoaded(roles));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> checkPermission({
    int? userId,
    int? roleId,
    required String permission,
  }) async {
    emit(const RbacState.loading());
    try {
      final allowed = await _rbacRepo.checkPermission(
        userId: userId,
        roleId: roleId,
        permission: permission,
      );
      emit(RbacState.permissionCheckResult(allowed));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }

  Future<void> removeUserRole(int userId, int roleId) async {
    emit(const RbacState.loading());
    try {
      await _rbacRepo.removeUserRole(userId, roleId);
      emit(const RbacState.roleRemoved());
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(RbacState.error(error: message));
    }
  }
}
