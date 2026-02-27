// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uploads_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UploadsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadsState()';
}


}

/// @nodoc
class $UploadsStateCopyWith<$Res>  {
$UploadsStateCopyWith(UploadsState _, $Res Function(UploadsState) __);
}


/// Adds pattern-matching-related methods to [UploadsState].
extension UploadsStatePatterns on UploadsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UploadsInitial value)?  initial,TResult Function( UploadsLoading value)?  loading,TResult Function( UploadsSuccess value)?  success,TResult Function( UploadsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial(_that);case UploadsLoading() when loading != null:
return loading(_that);case UploadsSuccess() when success != null:
return success(_that);case UploadsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UploadsInitial value)  initial,required TResult Function( UploadsLoading value)  loading,required TResult Function( UploadsSuccess value)  success,required TResult Function( UploadsError value)  error,}){
final _that = this;
switch (_that) {
case UploadsInitial():
return initial(_that);case UploadsLoading():
return loading(_that);case UploadsSuccess():
return success(_that);case UploadsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UploadsInitial value)?  initial,TResult? Function( UploadsLoading value)?  loading,TResult? Function( UploadsSuccess value)?  success,TResult? Function( UploadsError value)?  error,}){
final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial(_that);case UploadsLoading() when loading != null:
return loading(_that);case UploadsSuccess() when success != null:
return success(_that);case UploadsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<UploadEntry> uploads)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial();case UploadsLoading() when loading != null:
return loading();case UploadsSuccess() when success != null:
return success(_that.uploads);case UploadsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<UploadEntry> uploads)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case UploadsInitial():
return initial();case UploadsLoading():
return loading();case UploadsSuccess():
return success(_that.uploads);case UploadsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<UploadEntry> uploads)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial();case UploadsLoading() when loading != null:
return loading();case UploadsSuccess() when success != null:
return success(_that.uploads);case UploadsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class UploadsInitial implements UploadsState {
  const UploadsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadsState.initial()';
}


}




/// @nodoc


class UploadsLoading implements UploadsState {
  const UploadsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UploadsState.loading()';
}


}




/// @nodoc


class UploadsSuccess implements UploadsState {
  const UploadsSuccess(final  List<UploadEntry> uploads): _uploads = uploads;
  

 final  List<UploadEntry> _uploads;
 List<UploadEntry> get uploads {
  if (_uploads is EqualUnmodifiableListView) return _uploads;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_uploads);
}


/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadsSuccessCopyWith<UploadsSuccess> get copyWith => _$UploadsSuccessCopyWithImpl<UploadsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadsSuccess&&const DeepCollectionEquality().equals(other._uploads, _uploads));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_uploads));

@override
String toString() {
  return 'UploadsState.success(uploads: $uploads)';
}


}

/// @nodoc
abstract mixin class $UploadsSuccessCopyWith<$Res> implements $UploadsStateCopyWith<$Res> {
  factory $UploadsSuccessCopyWith(UploadsSuccess value, $Res Function(UploadsSuccess) _then) = _$UploadsSuccessCopyWithImpl;
@useResult
$Res call({
 List<UploadEntry> uploads
});




}
/// @nodoc
class _$UploadsSuccessCopyWithImpl<$Res>
    implements $UploadsSuccessCopyWith<$Res> {
  _$UploadsSuccessCopyWithImpl(this._self, this._then);

  final UploadsSuccess _self;
  final $Res Function(UploadsSuccess) _then;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? uploads = null,}) {
  return _then(UploadsSuccess(
null == uploads ? _self._uploads : uploads // ignore: cast_nullable_to_non_nullable
as List<UploadEntry>,
  ));
}


}

/// @nodoc


class UploadsError implements UploadsState {
  const UploadsError({required this.error});
  

 final  String error;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadsErrorCopyWith<UploadsError> get copyWith => _$UploadsErrorCopyWithImpl<UploadsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'UploadsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $UploadsErrorCopyWith<$Res> implements $UploadsStateCopyWith<$Res> {
  factory $UploadsErrorCopyWith(UploadsError value, $Res Function(UploadsError) _then) = _$UploadsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$UploadsErrorCopyWithImpl<$Res>
    implements $UploadsErrorCopyWith<$Res> {
  _$UploadsErrorCopyWithImpl(this._self, this._then);

  final UploadsError _self;
  final $Res Function(UploadsError) _then;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(UploadsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
