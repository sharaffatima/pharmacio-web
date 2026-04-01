part of '../cubit/rbac_cubit.dart';

@freezed
class RbacState with _$RbacState {
  const factory RbacState.initial() = RbacInitial;
  const factory RbacState.loading() = RbacLoading;
  const factory RbacState.rolesLoaded(List<RoleModel> roles) = RolesLoaded;
  const factory RbacState.roleLoaded(RoleModel role) = RoleLoaded;
  const factory RbacState.permissionsLoaded(List<PermissionModel> permissions) =
      PermissionsLoaded;
  const factory RbacState.permissionLoaded(PermissionModel permission) =
      PermissionLoaded;
  const factory RbacState.userRolesLoaded(List<RoleModel> roles) =
      UserRolesLoaded;
  const factory RbacState.permissionCheckResult(bool allowed) =
      PermissionCheckResult;
  const factory RbacState.roleRemoved() = RoleRemoved;
  const factory RbacState.error({required String error}) = RbacError;
}
