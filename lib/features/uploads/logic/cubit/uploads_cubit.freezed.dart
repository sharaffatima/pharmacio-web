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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UploadsInitial value)?  initial,TResult Function( UploadsLoading value)?  loading,TResult Function( UploadsError value)?  error,TResult Function( UploadSuccessState value)?  uploadSuccess,TResult Function( SuccessDeletedFile value)?  successDeletedFile,TResult Function( StatusSuccessState value)?  statusSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial(_that);case UploadsLoading() when loading != null:
return loading(_that);case UploadsError() when error != null:
return error(_that);case UploadSuccessState() when uploadSuccess != null:
return uploadSuccess(_that);case SuccessDeletedFile() when successDeletedFile != null:
return successDeletedFile(_that);case StatusSuccessState() when statusSuccess != null:
return statusSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UploadsInitial value)  initial,required TResult Function( UploadsLoading value)  loading,required TResult Function( UploadsError value)  error,required TResult Function( UploadSuccessState value)  uploadSuccess,required TResult Function( SuccessDeletedFile value)  successDeletedFile,required TResult Function( StatusSuccessState value)  statusSuccess,}){
final _that = this;
switch (_that) {
case UploadsInitial():
return initial(_that);case UploadsLoading():
return loading(_that);case UploadsError():
return error(_that);case UploadSuccessState():
return uploadSuccess(_that);case SuccessDeletedFile():
return successDeletedFile(_that);case StatusSuccessState():
return statusSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UploadsInitial value)?  initial,TResult? Function( UploadsLoading value)?  loading,TResult? Function( UploadsError value)?  error,TResult? Function( UploadSuccessState value)?  uploadSuccess,TResult? Function( SuccessDeletedFile value)?  successDeletedFile,TResult? Function( StatusSuccessState value)?  statusSuccess,}){
final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial(_that);case UploadsLoading() when loading != null:
return loading(_that);case UploadsError() when error != null:
return error(_that);case UploadSuccessState() when uploadSuccess != null:
return uploadSuccess(_that);case SuccessDeletedFile() when successDeletedFile != null:
return successDeletedFile(_that);case StatusSuccessState() when statusSuccess != null:
return statusSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String error)?  error,TResult Function( UploadResponse response)?  uploadSuccess,TResult Function( String successMsg)?  successDeletedFile,TResult Function( UploadResponse response)?  statusSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial();case UploadsLoading() when loading != null:
return loading();case UploadsError() when error != null:
return error(_that.error);case UploadSuccessState() when uploadSuccess != null:
return uploadSuccess(_that.response);case SuccessDeletedFile() when successDeletedFile != null:
return successDeletedFile(_that.successMsg);case StatusSuccessState() when statusSuccess != null:
return statusSuccess(_that.response);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String error)  error,required TResult Function( UploadResponse response)  uploadSuccess,required TResult Function( String successMsg)  successDeletedFile,required TResult Function( UploadResponse response)  statusSuccess,}) {final _that = this;
switch (_that) {
case UploadsInitial():
return initial();case UploadsLoading():
return loading();case UploadsError():
return error(_that.error);case UploadSuccessState():
return uploadSuccess(_that.response);case SuccessDeletedFile():
return successDeletedFile(_that.successMsg);case StatusSuccessState():
return statusSuccess(_that.response);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String error)?  error,TResult? Function( UploadResponse response)?  uploadSuccess,TResult? Function( String successMsg)?  successDeletedFile,TResult? Function( UploadResponse response)?  statusSuccess,}) {final _that = this;
switch (_that) {
case UploadsInitial() when initial != null:
return initial();case UploadsLoading() when loading != null:
return loading();case UploadsError() when error != null:
return error(_that.error);case UploadSuccessState() when uploadSuccess != null:
return uploadSuccess(_that.response);case SuccessDeletedFile() when successDeletedFile != null:
return successDeletedFile(_that.successMsg);case StatusSuccessState() when statusSuccess != null:
return statusSuccess(_that.response);case _:
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

/// @nodoc


class UploadSuccessState implements UploadsState {
  const UploadSuccessState(this.response);
  

 final  UploadResponse response;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadSuccessStateCopyWith<UploadSuccessState> get copyWith => _$UploadSuccessStateCopyWithImpl<UploadSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadSuccessState&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UploadsState.uploadSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $UploadSuccessStateCopyWith<$Res> implements $UploadsStateCopyWith<$Res> {
  factory $UploadSuccessStateCopyWith(UploadSuccessState value, $Res Function(UploadSuccessState) _then) = _$UploadSuccessStateCopyWithImpl;
@useResult
$Res call({
 UploadResponse response
});




}
/// @nodoc
class _$UploadSuccessStateCopyWithImpl<$Res>
    implements $UploadSuccessStateCopyWith<$Res> {
  _$UploadSuccessStateCopyWithImpl(this._self, this._then);

  final UploadSuccessState _self;
  final $Res Function(UploadSuccessState) _then;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UploadSuccessState(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UploadResponse,
  ));
}


}

/// @nodoc


class SuccessDeletedFile implements UploadsState {
  const SuccessDeletedFile(this.successMsg);
  

 final  String successMsg;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessDeletedFileCopyWith<SuccessDeletedFile> get copyWith => _$SuccessDeletedFileCopyWithImpl<SuccessDeletedFile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessDeletedFile&&(identical(other.successMsg, successMsg) || other.successMsg == successMsg));
}


@override
int get hashCode => Object.hash(runtimeType,successMsg);

@override
String toString() {
  return 'UploadsState.successDeletedFile(successMsg: $successMsg)';
}


}

/// @nodoc
abstract mixin class $SuccessDeletedFileCopyWith<$Res> implements $UploadsStateCopyWith<$Res> {
  factory $SuccessDeletedFileCopyWith(SuccessDeletedFile value, $Res Function(SuccessDeletedFile) _then) = _$SuccessDeletedFileCopyWithImpl;
@useResult
$Res call({
 String successMsg
});




}
/// @nodoc
class _$SuccessDeletedFileCopyWithImpl<$Res>
    implements $SuccessDeletedFileCopyWith<$Res> {
  _$SuccessDeletedFileCopyWithImpl(this._self, this._then);

  final SuccessDeletedFile _self;
  final $Res Function(SuccessDeletedFile) _then;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? successMsg = null,}) {
  return _then(SuccessDeletedFile(
null == successMsg ? _self.successMsg : successMsg // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class StatusSuccessState implements UploadsState {
  const StatusSuccessState(this.response);
  

 final  UploadResponse response;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusSuccessStateCopyWith<StatusSuccessState> get copyWith => _$StatusSuccessStateCopyWithImpl<StatusSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusSuccessState&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UploadsState.statusSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $StatusSuccessStateCopyWith<$Res> implements $UploadsStateCopyWith<$Res> {
  factory $StatusSuccessStateCopyWith(StatusSuccessState value, $Res Function(StatusSuccessState) _then) = _$StatusSuccessStateCopyWithImpl;
@useResult
$Res call({
 UploadResponse response
});




}
/// @nodoc
class _$StatusSuccessStateCopyWithImpl<$Res>
    implements $StatusSuccessStateCopyWith<$Res> {
  _$StatusSuccessStateCopyWithImpl(this._self, this._then);

  final StatusSuccessState _self;
  final $Res Function(StatusSuccessState) _then;

/// Create a copy of UploadsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(StatusSuccessState(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as UploadResponse,
  ));
}


}

// dart format on
