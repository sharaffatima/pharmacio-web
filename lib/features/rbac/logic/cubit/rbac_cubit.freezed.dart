// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rbac_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RbacState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState()';
}


}

/// @nodoc
class $RbacStateCopyWith<$Res>  {
$RbacStateCopyWith(RbacState _, $Res Function(RbacState) __);
}


/// Adds pattern-matching-related methods to [RbacState].
extension RbacStatePatterns on RbacState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RbacInitial value)?  initial,TResult Function( RbacLoading value)?  loading,TResult Function( RolesLoaded value)?  rolesLoaded,TResult Function( RoleLoaded value)?  roleLoaded,TResult Function( PermissionsLoaded value)?  permissionsLoaded,TResult Function( PermissionLoaded value)?  permissionLoaded,TResult Function( UserRolesLoaded value)?  userRolesLoaded,TResult Function( PermissionCheckResult value)?  permissionCheckResult,TResult Function( RoleRemoved value)?  roleRemoved,TResult Function( RbacError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial(_that);case RbacLoading() when loading != null:
return loading(_that);case RolesLoaded() when rolesLoaded != null:
return rolesLoaded(_that);case RoleLoaded() when roleLoaded != null:
return roleLoaded(_that);case PermissionsLoaded() when permissionsLoaded != null:
return permissionsLoaded(_that);case PermissionLoaded() when permissionLoaded != null:
return permissionLoaded(_that);case UserRolesLoaded() when userRolesLoaded != null:
return userRolesLoaded(_that);case PermissionCheckResult() when permissionCheckResult != null:
return permissionCheckResult(_that);case RoleRemoved() when roleRemoved != null:
return roleRemoved(_that);case RbacError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RbacInitial value)  initial,required TResult Function( RbacLoading value)  loading,required TResult Function( RolesLoaded value)  rolesLoaded,required TResult Function( RoleLoaded value)  roleLoaded,required TResult Function( PermissionsLoaded value)  permissionsLoaded,required TResult Function( PermissionLoaded value)  permissionLoaded,required TResult Function( UserRolesLoaded value)  userRolesLoaded,required TResult Function( PermissionCheckResult value)  permissionCheckResult,required TResult Function( RoleRemoved value)  roleRemoved,required TResult Function( RbacError value)  error,}){
final _that = this;
switch (_that) {
case RbacInitial():
return initial(_that);case RbacLoading():
return loading(_that);case RolesLoaded():
return rolesLoaded(_that);case RoleLoaded():
return roleLoaded(_that);case PermissionsLoaded():
return permissionsLoaded(_that);case PermissionLoaded():
return permissionLoaded(_that);case UserRolesLoaded():
return userRolesLoaded(_that);case PermissionCheckResult():
return permissionCheckResult(_that);case RoleRemoved():
return roleRemoved(_that);case RbacError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RbacInitial value)?  initial,TResult? Function( RbacLoading value)?  loading,TResult? Function( RolesLoaded value)?  rolesLoaded,TResult? Function( RoleLoaded value)?  roleLoaded,TResult? Function( PermissionsLoaded value)?  permissionsLoaded,TResult? Function( PermissionLoaded value)?  permissionLoaded,TResult? Function( UserRolesLoaded value)?  userRolesLoaded,TResult? Function( PermissionCheckResult value)?  permissionCheckResult,TResult? Function( RoleRemoved value)?  roleRemoved,TResult? Function( RbacError value)?  error,}){
final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial(_that);case RbacLoading() when loading != null:
return loading(_that);case RolesLoaded() when rolesLoaded != null:
return rolesLoaded(_that);case RoleLoaded() when roleLoaded != null:
return roleLoaded(_that);case PermissionsLoaded() when permissionsLoaded != null:
return permissionsLoaded(_that);case PermissionLoaded() when permissionLoaded != null:
return permissionLoaded(_that);case UserRolesLoaded() when userRolesLoaded != null:
return userRolesLoaded(_that);case PermissionCheckResult() when permissionCheckResult != null:
return permissionCheckResult(_that);case RoleRemoved() when roleRemoved != null:
return roleRemoved(_that);case RbacError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<RoleModel> roles)?  rolesLoaded,TResult Function( RoleModel role)?  roleLoaded,TResult Function( List<PermissionModel> permissions)?  permissionsLoaded,TResult Function( PermissionModel permission)?  permissionLoaded,TResult Function( List<RoleModel> roles)?  userRolesLoaded,TResult Function( bool allowed)?  permissionCheckResult,TResult Function()?  roleRemoved,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial();case RbacLoading() when loading != null:
return loading();case RolesLoaded() when rolesLoaded != null:
return rolesLoaded(_that.roles);case RoleLoaded() when roleLoaded != null:
return roleLoaded(_that.role);case PermissionsLoaded() when permissionsLoaded != null:
return permissionsLoaded(_that.permissions);case PermissionLoaded() when permissionLoaded != null:
return permissionLoaded(_that.permission);case UserRolesLoaded() when userRolesLoaded != null:
return userRolesLoaded(_that.roles);case PermissionCheckResult() when permissionCheckResult != null:
return permissionCheckResult(_that.allowed);case RoleRemoved() when roleRemoved != null:
return roleRemoved();case RbacError() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<RoleModel> roles)  rolesLoaded,required TResult Function( RoleModel role)  roleLoaded,required TResult Function( List<PermissionModel> permissions)  permissionsLoaded,required TResult Function( PermissionModel permission)  permissionLoaded,required TResult Function( List<RoleModel> roles)  userRolesLoaded,required TResult Function( bool allowed)  permissionCheckResult,required TResult Function()  roleRemoved,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case RbacInitial():
return initial();case RbacLoading():
return loading();case RolesLoaded():
return rolesLoaded(_that.roles);case RoleLoaded():
return roleLoaded(_that.role);case PermissionsLoaded():
return permissionsLoaded(_that.permissions);case PermissionLoaded():
return permissionLoaded(_that.permission);case UserRolesLoaded():
return userRolesLoaded(_that.roles);case PermissionCheckResult():
return permissionCheckResult(_that.allowed);case RoleRemoved():
return roleRemoved();case RbacError():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<RoleModel> roles)?  rolesLoaded,TResult? Function( RoleModel role)?  roleLoaded,TResult? Function( List<PermissionModel> permissions)?  permissionsLoaded,TResult? Function( PermissionModel permission)?  permissionLoaded,TResult? Function( List<RoleModel> roles)?  userRolesLoaded,TResult? Function( bool allowed)?  permissionCheckResult,TResult? Function()?  roleRemoved,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case RbacInitial() when initial != null:
return initial();case RbacLoading() when loading != null:
return loading();case RolesLoaded() when rolesLoaded != null:
return rolesLoaded(_that.roles);case RoleLoaded() when roleLoaded != null:
return roleLoaded(_that.role);case PermissionsLoaded() when permissionsLoaded != null:
return permissionsLoaded(_that.permissions);case PermissionLoaded() when permissionLoaded != null:
return permissionLoaded(_that.permission);case UserRolesLoaded() when userRolesLoaded != null:
return userRolesLoaded(_that.roles);case PermissionCheckResult() when permissionCheckResult != null:
return permissionCheckResult(_that.allowed);case RoleRemoved() when roleRemoved != null:
return roleRemoved();case RbacError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class RbacInitial implements RbacState {
  const RbacInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.initial()';
}


}




/// @nodoc


class RbacLoading implements RbacState {
  const RbacLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.loading()';
}


}




/// @nodoc


class RolesLoaded implements RbacState {
  const RolesLoaded(final  List<RoleModel> roles): _roles = roles;
  

 final  List<RoleModel> _roles;
 List<RoleModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesLoadedCopyWith<RolesLoaded> get copyWith => _$RolesLoadedCopyWithImpl<RolesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesLoaded&&const DeepCollectionEquality().equals(other._roles, _roles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'RbacState.rolesLoaded(roles: $roles)';
}


}

/// @nodoc
abstract mixin class $RolesLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $RolesLoadedCopyWith(RolesLoaded value, $Res Function(RolesLoaded) _then) = _$RolesLoadedCopyWithImpl;
@useResult
$Res call({
 List<RoleModel> roles
});




}
/// @nodoc
class _$RolesLoadedCopyWithImpl<$Res>
    implements $RolesLoadedCopyWith<$Res> {
  _$RolesLoadedCopyWithImpl(this._self, this._then);

  final RolesLoaded _self;
  final $Res Function(RolesLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roles = null,}) {
  return _then(RolesLoaded(
null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleModel>,
  ));
}


}

/// @nodoc


class RoleLoaded implements RbacState {
  const RoleLoaded(this.role);
  

 final  RoleModel role;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleLoadedCopyWith<RoleLoaded> get copyWith => _$RoleLoadedCopyWithImpl<RoleLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleLoaded&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'RbacState.roleLoaded(role: $role)';
}


}

/// @nodoc
abstract mixin class $RoleLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $RoleLoadedCopyWith(RoleLoaded value, $Res Function(RoleLoaded) _then) = _$RoleLoadedCopyWithImpl;
@useResult
$Res call({
 RoleModel role
});




}
/// @nodoc
class _$RoleLoadedCopyWithImpl<$Res>
    implements $RoleLoadedCopyWith<$Res> {
  _$RoleLoadedCopyWithImpl(this._self, this._then);

  final RoleLoaded _self;
  final $Res Function(RoleLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,}) {
  return _then(RoleLoaded(
null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as RoleModel,
  ));
}


}

/// @nodoc


class PermissionsLoaded implements RbacState {
  const PermissionsLoaded(final  List<PermissionModel> permissions): _permissions = permissions;
  

 final  List<PermissionModel> _permissions;
 List<PermissionModel> get permissions {
  if (_permissions is EqualUnmodifiableListView) return _permissions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_permissions);
}


/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionsLoadedCopyWith<PermissionsLoaded> get copyWith => _$PermissionsLoadedCopyWithImpl<PermissionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionsLoaded&&const DeepCollectionEquality().equals(other._permissions, _permissions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_permissions));

@override
String toString() {
  return 'RbacState.permissionsLoaded(permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $PermissionsLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $PermissionsLoadedCopyWith(PermissionsLoaded value, $Res Function(PermissionsLoaded) _then) = _$PermissionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<PermissionModel> permissions
});




}
/// @nodoc
class _$PermissionsLoadedCopyWithImpl<$Res>
    implements $PermissionsLoadedCopyWith<$Res> {
  _$PermissionsLoadedCopyWithImpl(this._self, this._then);

  final PermissionsLoaded _self;
  final $Res Function(PermissionsLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permissions = null,}) {
  return _then(PermissionsLoaded(
null == permissions ? _self._permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionModel>,
  ));
}


}

/// @nodoc


class PermissionLoaded implements RbacState {
  const PermissionLoaded(this.permission);
  

 final  PermissionModel permission;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionLoadedCopyWith<PermissionLoaded> get copyWith => _$PermissionLoadedCopyWithImpl<PermissionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionLoaded&&(identical(other.permission, permission) || other.permission == permission));
}


@override
int get hashCode => Object.hash(runtimeType,permission);

@override
String toString() {
  return 'RbacState.permissionLoaded(permission: $permission)';
}


}

/// @nodoc
abstract mixin class $PermissionLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $PermissionLoadedCopyWith(PermissionLoaded value, $Res Function(PermissionLoaded) _then) = _$PermissionLoadedCopyWithImpl;
@useResult
$Res call({
 PermissionModel permission
});




}
/// @nodoc
class _$PermissionLoadedCopyWithImpl<$Res>
    implements $PermissionLoadedCopyWith<$Res> {
  _$PermissionLoadedCopyWithImpl(this._self, this._then);

  final PermissionLoaded _self;
  final $Res Function(PermissionLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? permission = null,}) {
  return _then(PermissionLoaded(
null == permission ? _self.permission : permission // ignore: cast_nullable_to_non_nullable
as PermissionModel,
  ));
}


}

/// @nodoc


class UserRolesLoaded implements RbacState {
  const UserRolesLoaded(final  List<RoleModel> roles): _roles = roles;
  

 final  List<RoleModel> _roles;
 List<RoleModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}


/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserRolesLoadedCopyWith<UserRolesLoaded> get copyWith => _$UserRolesLoadedCopyWithImpl<UserRolesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserRolesLoaded&&const DeepCollectionEquality().equals(other._roles, _roles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_roles));

@override
String toString() {
  return 'RbacState.userRolesLoaded(roles: $roles)';
}


}

/// @nodoc
abstract mixin class $UserRolesLoadedCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $UserRolesLoadedCopyWith(UserRolesLoaded value, $Res Function(UserRolesLoaded) _then) = _$UserRolesLoadedCopyWithImpl;
@useResult
$Res call({
 List<RoleModel> roles
});




}
/// @nodoc
class _$UserRolesLoadedCopyWithImpl<$Res>
    implements $UserRolesLoadedCopyWith<$Res> {
  _$UserRolesLoadedCopyWithImpl(this._self, this._then);

  final UserRolesLoaded _self;
  final $Res Function(UserRolesLoaded) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? roles = null,}) {
  return _then(UserRolesLoaded(
null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<RoleModel>,
  ));
}


}

/// @nodoc


class PermissionCheckResult implements RbacState {
  const PermissionCheckResult(this.allowed);
  

 final  bool allowed;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionCheckResultCopyWith<PermissionCheckResult> get copyWith => _$PermissionCheckResultCopyWithImpl<PermissionCheckResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionCheckResult&&(identical(other.allowed, allowed) || other.allowed == allowed));
}


@override
int get hashCode => Object.hash(runtimeType,allowed);

@override
String toString() {
  return 'RbacState.permissionCheckResult(allowed: $allowed)';
}


}

/// @nodoc
abstract mixin class $PermissionCheckResultCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $PermissionCheckResultCopyWith(PermissionCheckResult value, $Res Function(PermissionCheckResult) _then) = _$PermissionCheckResultCopyWithImpl;
@useResult
$Res call({
 bool allowed
});




}
/// @nodoc
class _$PermissionCheckResultCopyWithImpl<$Res>
    implements $PermissionCheckResultCopyWith<$Res> {
  _$PermissionCheckResultCopyWithImpl(this._self, this._then);

  final PermissionCheckResult _self;
  final $Res Function(PermissionCheckResult) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allowed = null,}) {
  return _then(PermissionCheckResult(
null == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class RoleRemoved implements RbacState {
  const RoleRemoved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleRemoved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RbacState.roleRemoved()';
}


}




/// @nodoc


class RbacError implements RbacState {
  const RbacError({required this.error});
  

 final  String error;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RbacErrorCopyWith<RbacError> get copyWith => _$RbacErrorCopyWithImpl<RbacError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RbacError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RbacState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $RbacErrorCopyWith<$Res> implements $RbacStateCopyWith<$Res> {
  factory $RbacErrorCopyWith(RbacError value, $Res Function(RbacError) _then) = _$RbacErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$RbacErrorCopyWithImpl<$Res>
    implements $RbacErrorCopyWith<$Res> {
  _$RbacErrorCopyWithImpl(this._self, this._then);

  final RbacError _self;
  final $Res Function(RbacError) _then;

/// Create a copy of RbacState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(RbacError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
