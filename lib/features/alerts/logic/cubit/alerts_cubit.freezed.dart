// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alerts_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertsState()';
}


}

/// @nodoc
class $AlertsStateCopyWith<$Res>  {
$AlertsStateCopyWith(AlertsState _, $Res Function(AlertsState) __);
}


/// Adds pattern-matching-related methods to [AlertsState].
extension AlertsStatePatterns on AlertsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AlertsInitial value)?  initial,TResult Function( AlertsLoading value)?  loading,TResult Function( AlertsSuccess value)?  success,TResult Function( AlertsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial(_that);case AlertsLoading() when loading != null:
return loading(_that);case AlertsSuccess() when success != null:
return success(_that);case AlertsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AlertsInitial value)  initial,required TResult Function( AlertsLoading value)  loading,required TResult Function( AlertsSuccess value)  success,required TResult Function( AlertsError value)  error,}){
final _that = this;
switch (_that) {
case AlertsInitial():
return initial(_that);case AlertsLoading():
return loading(_that);case AlertsSuccess():
return success(_that);case AlertsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AlertsInitial value)?  initial,TResult? Function( AlertsLoading value)?  loading,TResult? Function( AlertsSuccess value)?  success,TResult? Function( AlertsError value)?  error,}){
final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial(_that);case AlertsLoading() when loading != null:
return loading(_that);case AlertsSuccess() when success != null:
return success(_that);case AlertsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AlertItem> alerts,  int tabIndex,  String selectedSeverity)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial();case AlertsLoading() when loading != null:
return loading();case AlertsSuccess() when success != null:
return success(_that.alerts,_that.tabIndex,_that.selectedSeverity);case AlertsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AlertItem> alerts,  int tabIndex,  String selectedSeverity)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case AlertsInitial():
return initial();case AlertsLoading():
return loading();case AlertsSuccess():
return success(_that.alerts,_that.tabIndex,_that.selectedSeverity);case AlertsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AlertItem> alerts,  int tabIndex,  String selectedSeverity)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial();case AlertsLoading() when loading != null:
return loading();case AlertsSuccess() when success != null:
return success(_that.alerts,_that.tabIndex,_that.selectedSeverity);case AlertsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AlertsInitial implements AlertsState {
  const AlertsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertsState.initial()';
}


}




/// @nodoc


class AlertsLoading implements AlertsState {
  const AlertsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AlertsState.loading()';
}


}




/// @nodoc


class AlertsSuccess implements AlertsState {
  const AlertsSuccess({required final  List<AlertItem> alerts, required this.tabIndex, required this.selectedSeverity}): _alerts = alerts;
  

 final  List<AlertItem> _alerts;
 List<AlertItem> get alerts {
  if (_alerts is EqualUnmodifiableListView) return _alerts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alerts);
}

 final  int tabIndex;
 final  String selectedSeverity;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertsSuccessCopyWith<AlertsSuccess> get copyWith => _$AlertsSuccessCopyWithImpl<AlertsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsSuccess&&const DeepCollectionEquality().equals(other._alerts, _alerts)&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.selectedSeverity, selectedSeverity) || other.selectedSeverity == selectedSeverity));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_alerts),tabIndex,selectedSeverity);

@override
String toString() {
  return 'AlertsState.success(alerts: $alerts, tabIndex: $tabIndex, selectedSeverity: $selectedSeverity)';
}


}

/// @nodoc
abstract mixin class $AlertsSuccessCopyWith<$Res> implements $AlertsStateCopyWith<$Res> {
  factory $AlertsSuccessCopyWith(AlertsSuccess value, $Res Function(AlertsSuccess) _then) = _$AlertsSuccessCopyWithImpl;
@useResult
$Res call({
 List<AlertItem> alerts, int tabIndex, String selectedSeverity
});




}
/// @nodoc
class _$AlertsSuccessCopyWithImpl<$Res>
    implements $AlertsSuccessCopyWith<$Res> {
  _$AlertsSuccessCopyWithImpl(this._self, this._then);

  final AlertsSuccess _self;
  final $Res Function(AlertsSuccess) _then;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? alerts = null,Object? tabIndex = null,Object? selectedSeverity = null,}) {
  return _then(AlertsSuccess(
alerts: null == alerts ? _self._alerts : alerts // ignore: cast_nullable_to_non_nullable
as List<AlertItem>,tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSeverity: null == selectedSeverity ? _self.selectedSeverity : selectedSeverity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AlertsError implements AlertsState {
  const AlertsError({required this.error});
  

 final  String error;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertsErrorCopyWith<AlertsError> get copyWith => _$AlertsErrorCopyWithImpl<AlertsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AlertsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AlertsErrorCopyWith<$Res> implements $AlertsStateCopyWith<$Res> {
  factory $AlertsErrorCopyWith(AlertsError value, $Res Function(AlertsError) _then) = _$AlertsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AlertsErrorCopyWithImpl<$Res>
    implements $AlertsErrorCopyWith<$Res> {
  _$AlertsErrorCopyWithImpl(this._self, this._then);

  final AlertsError _self;
  final $Res Function(AlertsError) _then;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AlertsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
