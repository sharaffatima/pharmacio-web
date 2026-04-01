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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AlertsInitial value)?  initial,TResult Function( AlertsSuccess value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial(_that);case AlertsSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AlertsInitial value)  initial,required TResult Function( AlertsSuccess value)  success,}){
final _that = this;
switch (_that) {
case AlertsInitial():
return initial(_that);case AlertsSuccess():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AlertsInitial value)?  initial,TResult? Function( AlertsSuccess value)?  success,}){
final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial(_that);case AlertsSuccess() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int tabIndex,  String selectedSeverity)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial();case AlertsSuccess() when success != null:
return success(_that.tabIndex,_that.selectedSeverity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int tabIndex,  String selectedSeverity)  success,}) {final _that = this;
switch (_that) {
case AlertsInitial():
return initial();case AlertsSuccess():
return success(_that.tabIndex,_that.selectedSeverity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int tabIndex,  String selectedSeverity)?  success,}) {final _that = this;
switch (_that) {
case AlertsInitial() when initial != null:
return initial();case AlertsSuccess() when success != null:
return success(_that.tabIndex,_that.selectedSeverity);case _:
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


class AlertsSuccess implements AlertsState {
  const AlertsSuccess({required this.tabIndex, required this.selectedSeverity});
  

 final  int tabIndex;
 final  String selectedSeverity;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertsSuccessCopyWith<AlertsSuccess> get copyWith => _$AlertsSuccessCopyWithImpl<AlertsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsSuccess&&(identical(other.tabIndex, tabIndex) || other.tabIndex == tabIndex)&&(identical(other.selectedSeverity, selectedSeverity) || other.selectedSeverity == selectedSeverity));
}


@override
int get hashCode => Object.hash(runtimeType,tabIndex,selectedSeverity);

@override
String toString() {
  return 'AlertsState.success(tabIndex: $tabIndex, selectedSeverity: $selectedSeverity)';
}


}

/// @nodoc
abstract mixin class $AlertsSuccessCopyWith<$Res> implements $AlertsStateCopyWith<$Res> {
  factory $AlertsSuccessCopyWith(AlertsSuccess value, $Res Function(AlertsSuccess) _then) = _$AlertsSuccessCopyWithImpl;
@useResult
$Res call({
 int tabIndex, String selectedSeverity
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
@pragma('vm:prefer-inline') $Res call({Object? tabIndex = null,Object? selectedSeverity = null,}) {
  return _then(AlertsSuccess(
tabIndex: null == tabIndex ? _self.tabIndex : tabIndex // ignore: cast_nullable_to_non_nullable
as int,selectedSeverity: null == selectedSeverity ? _self.selectedSeverity : selectedSeverity // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
