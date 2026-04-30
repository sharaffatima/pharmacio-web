// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardInitial value)?  initial,TResult Function( DashboardLoading value)?  loading,TResult Function( DashboardSuccess value)?  success,TResult Function( DashboardError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial(_that);case DashboardLoading() when loading != null:
return loading(_that);case DashboardSuccess() when success != null:
return success(_that);case DashboardError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardInitial value)  initial,required TResult Function( DashboardLoading value)  loading,required TResult Function( DashboardSuccess value)  success,required TResult Function( DashboardError value)  error,}){
final _that = this;
switch (_that) {
case DashboardInitial():
return initial(_that);case DashboardLoading():
return loading(_that);case DashboardSuccess():
return success(_that);case DashboardError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardInitial value)?  initial,TResult? Function( DashboardLoading value)?  loading,TResult? Function( DashboardSuccess value)?  success,TResult? Function( DashboardError value)?  error,}){
final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial(_that);case DashboardLoading() when loading != null:
return loading(_that);case DashboardSuccess() when success != null:
return success(_that);case DashboardError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DashboardStatsResponse stats,  List<DashboardRecentActivityItem> recentActivity)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial();case DashboardLoading() when loading != null:
return loading();case DashboardSuccess() when success != null:
return success(_that.stats,_that.recentActivity);case DashboardError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DashboardStatsResponse stats,  List<DashboardRecentActivityItem> recentActivity)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case DashboardInitial():
return initial();case DashboardLoading():
return loading();case DashboardSuccess():
return success(_that.stats,_that.recentActivity);case DashboardError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DashboardStatsResponse stats,  List<DashboardRecentActivityItem> recentActivity)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial();case DashboardLoading() when loading != null:
return loading();case DashboardSuccess() when success != null:
return success(_that.stats,_that.recentActivity);case DashboardError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DashboardInitial implements DashboardState {
  const DashboardInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.initial()';
}


}




/// @nodoc


class DashboardLoading implements DashboardState {
  const DashboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.loading()';
}


}




/// @nodoc


class DashboardSuccess implements DashboardState {
  const DashboardSuccess({required this.stats, required final  List<DashboardRecentActivityItem> recentActivity}): _recentActivity = recentActivity;
  

 final  DashboardStatsResponse stats;
 final  List<DashboardRecentActivityItem> _recentActivity;
 List<DashboardRecentActivityItem> get recentActivity {
  if (_recentActivity is EqualUnmodifiableListView) return _recentActivity;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentActivity);
}


/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSuccessCopyWith<DashboardSuccess> get copyWith => _$DashboardSuccessCopyWithImpl<DashboardSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSuccess&&(identical(other.stats, stats) || other.stats == stats)&&const DeepCollectionEquality().equals(other._recentActivity, _recentActivity));
}


@override
int get hashCode => Object.hash(runtimeType,stats,const DeepCollectionEquality().hash(_recentActivity));

@override
String toString() {
  return 'DashboardState.success(stats: $stats, recentActivity: $recentActivity)';
}


}

/// @nodoc
abstract mixin class $DashboardSuccessCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardSuccessCopyWith(DashboardSuccess value, $Res Function(DashboardSuccess) _then) = _$DashboardSuccessCopyWithImpl;
@useResult
$Res call({
 DashboardStatsResponse stats, List<DashboardRecentActivityItem> recentActivity
});




}
/// @nodoc
class _$DashboardSuccessCopyWithImpl<$Res>
    implements $DashboardSuccessCopyWith<$Res> {
  _$DashboardSuccessCopyWithImpl(this._self, this._then);

  final DashboardSuccess _self;
  final $Res Function(DashboardSuccess) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? stats = null,Object? recentActivity = null,}) {
  return _then(DashboardSuccess(
stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as DashboardStatsResponse,recentActivity: null == recentActivity ? _self._recentActivity : recentActivity // ignore: cast_nullable_to_non_nullable
as List<DashboardRecentActivityItem>,
  ));
}


}

/// @nodoc


class DashboardError implements DashboardState {
  const DashboardError({required this.error});
  

 final  String error;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardErrorCopyWith<DashboardError> get copyWith => _$DashboardErrorCopyWithImpl<DashboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DashboardState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DashboardErrorCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardErrorCopyWith(DashboardError value, $Res Function(DashboardError) _then) = _$DashboardErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DashboardErrorCopyWithImpl<$Res>
    implements $DashboardErrorCopyWith<$Res> {
  _$DashboardErrorCopyWithImpl(this._self, this._then);

  final DashboardError _self;
  final $Res Function(DashboardError) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DashboardError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
