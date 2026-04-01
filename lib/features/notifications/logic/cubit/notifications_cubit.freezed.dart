// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState()';
}


}

/// @nodoc
class $NotificationsStateCopyWith<$Res>  {
$NotificationsStateCopyWith(NotificationsState _, $Res Function(NotificationsState) __);
}


/// Adds pattern-matching-related methods to [NotificationsState].
extension NotificationsStatePatterns on NotificationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NotificationsInitial value)?  initial,TResult Function( NotificationsLoading value)?  loading,TResult Function( NotificationsSuccess value)?  success,TResult Function( NotificationsMarkReadSuccess value)?  markReadSuccess,TResult Function( NotificationsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsSuccess() when success != null:
return success(_that);case NotificationsMarkReadSuccess() when markReadSuccess != null:
return markReadSuccess(_that);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NotificationsInitial value)  initial,required TResult Function( NotificationsLoading value)  loading,required TResult Function( NotificationsSuccess value)  success,required TResult Function( NotificationsMarkReadSuccess value)  markReadSuccess,required TResult Function( NotificationsError value)  error,}){
final _that = this;
switch (_that) {
case NotificationsInitial():
return initial(_that);case NotificationsLoading():
return loading(_that);case NotificationsSuccess():
return success(_that);case NotificationsMarkReadSuccess():
return markReadSuccess(_that);case NotificationsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NotificationsInitial value)?  initial,TResult? Function( NotificationsLoading value)?  loading,TResult? Function( NotificationsSuccess value)?  success,TResult? Function( NotificationsMarkReadSuccess value)?  markReadSuccess,TResult? Function( NotificationsError value)?  error,}){
final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial(_that);case NotificationsLoading() when loading != null:
return loading(_that);case NotificationsSuccess() when success != null:
return success(_that);case NotificationsMarkReadSuccess() when markReadSuccess != null:
return markReadSuccess(_that);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NotificationsResponse response)?  success,TResult Function( UserNotificationModel notification)?  markReadSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsSuccess() when success != null:
return success(_that.response);case NotificationsMarkReadSuccess() when markReadSuccess != null:
return markReadSuccess(_that.notification);case NotificationsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NotificationsResponse response)  success,required TResult Function( UserNotificationModel notification)  markReadSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case NotificationsInitial():
return initial();case NotificationsLoading():
return loading();case NotificationsSuccess():
return success(_that.response);case NotificationsMarkReadSuccess():
return markReadSuccess(_that.notification);case NotificationsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NotificationsResponse response)?  success,TResult? Function( UserNotificationModel notification)?  markReadSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case NotificationsInitial() when initial != null:
return initial();case NotificationsLoading() when loading != null:
return loading();case NotificationsSuccess() when success != null:
return success(_that.response);case NotificationsMarkReadSuccess() when markReadSuccess != null:
return markReadSuccess(_that.notification);case NotificationsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class NotificationsInitial implements NotificationsState {
  const NotificationsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.initial()';
}


}




/// @nodoc


class NotificationsLoading implements NotificationsState {
  const NotificationsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NotificationsState.loading()';
}


}




/// @nodoc


class NotificationsSuccess implements NotificationsState {
  const NotificationsSuccess(this.response);
  

 final  NotificationsResponse response;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsSuccessCopyWith<NotificationsSuccess> get copyWith => _$NotificationsSuccessCopyWithImpl<NotificationsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'NotificationsState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $NotificationsSuccessCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsSuccessCopyWith(NotificationsSuccess value, $Res Function(NotificationsSuccess) _then) = _$NotificationsSuccessCopyWithImpl;
@useResult
$Res call({
 NotificationsResponse response
});




}
/// @nodoc
class _$NotificationsSuccessCopyWithImpl<$Res>
    implements $NotificationsSuccessCopyWith<$Res> {
  _$NotificationsSuccessCopyWithImpl(this._self, this._then);

  final NotificationsSuccess _self;
  final $Res Function(NotificationsSuccess) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(NotificationsSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as NotificationsResponse,
  ));
}


}

/// @nodoc


class NotificationsMarkReadSuccess implements NotificationsState {
  const NotificationsMarkReadSuccess(this.notification);
  

 final  UserNotificationModel notification;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsMarkReadSuccessCopyWith<NotificationsMarkReadSuccess> get copyWith => _$NotificationsMarkReadSuccessCopyWithImpl<NotificationsMarkReadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsMarkReadSuccess&&(identical(other.notification, notification) || other.notification == notification));
}


@override
int get hashCode => Object.hash(runtimeType,notification);

@override
String toString() {
  return 'NotificationsState.markReadSuccess(notification: $notification)';
}


}

/// @nodoc
abstract mixin class $NotificationsMarkReadSuccessCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsMarkReadSuccessCopyWith(NotificationsMarkReadSuccess value, $Res Function(NotificationsMarkReadSuccess) _then) = _$NotificationsMarkReadSuccessCopyWithImpl;
@useResult
$Res call({
 UserNotificationModel notification
});




}
/// @nodoc
class _$NotificationsMarkReadSuccessCopyWithImpl<$Res>
    implements $NotificationsMarkReadSuccessCopyWith<$Res> {
  _$NotificationsMarkReadSuccessCopyWithImpl(this._self, this._then);

  final NotificationsMarkReadSuccess _self;
  final $Res Function(NotificationsMarkReadSuccess) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notification = null,}) {
  return _then(NotificationsMarkReadSuccess(
null == notification ? _self.notification : notification // ignore: cast_nullable_to_non_nullable
as UserNotificationModel,
  ));
}


}

/// @nodoc


class NotificationsError implements NotificationsState {
  const NotificationsError({required this.error});
  

 final  String error;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsErrorCopyWith<NotificationsError> get copyWith => _$NotificationsErrorCopyWithImpl<NotificationsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NotificationsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $NotificationsErrorCopyWith<$Res> implements $NotificationsStateCopyWith<$Res> {
  factory $NotificationsErrorCopyWith(NotificationsError value, $Res Function(NotificationsError) _then) = _$NotificationsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$NotificationsErrorCopyWithImpl<$Res>
    implements $NotificationsErrorCopyWith<$Res> {
  _$NotificationsErrorCopyWithImpl(this._self, this._then);

  final NotificationsError _self;
  final $Res Function(NotificationsError) _then;

/// Create a copy of NotificationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(NotificationsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
