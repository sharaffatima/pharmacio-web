// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compare_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompareState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompareState()';
}


}

/// @nodoc
class $CompareStateCopyWith<$Res>  {
$CompareStateCopyWith(CompareState _, $Res Function(CompareState) __);
}


/// Adds pattern-matching-related methods to [CompareState].
extension CompareStatePatterns on CompareState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompareInitial value)?  initial,TResult Function( CompareLoading value)?  loading,TResult Function( CompareSuccess value)?  success,TResult Function( CompareError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial(_that);case CompareLoading() when loading != null:
return loading(_that);case CompareSuccess() when success != null:
return success(_that);case CompareError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompareInitial value)  initial,required TResult Function( CompareLoading value)  loading,required TResult Function( CompareSuccess value)  success,required TResult Function( CompareError value)  error,}){
final _that = this;
switch (_that) {
case CompareInitial():
return initial(_that);case CompareLoading():
return loading(_that);case CompareSuccess():
return success(_that);case CompareError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompareInitial value)?  initial,TResult? Function( CompareLoading value)?  loading,TResult? Function( CompareSuccess value)?  success,TResult? Function( CompareError value)?  error,}){
final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial(_that);case CompareLoading() when loading != null:
return loading(_that);case CompareSuccess() when success != null:
return success(_that);case CompareError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CompareOfferItem> offers)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial();case CompareLoading() when loading != null:
return loading();case CompareSuccess() when success != null:
return success(_that.offers);case CompareError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CompareOfferItem> offers)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case CompareInitial():
return initial();case CompareLoading():
return loading();case CompareSuccess():
return success(_that.offers);case CompareError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CompareOfferItem> offers)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial();case CompareLoading() when loading != null:
return loading();case CompareSuccess() when success != null:
return success(_that.offers);case CompareError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CompareInitial implements CompareState {
  const CompareInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompareState.initial()';
}


}




/// @nodoc


class CompareLoading implements CompareState {
  const CompareLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompareState.loading()';
}


}




/// @nodoc


class CompareSuccess implements CompareState {
  const CompareSuccess(final  List<CompareOfferItem> offers): _offers = offers;
  

 final  List<CompareOfferItem> _offers;
 List<CompareOfferItem> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}


/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompareSuccessCopyWith<CompareSuccess> get copyWith => _$CompareSuccessCopyWithImpl<CompareSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareSuccess&&const DeepCollectionEquality().equals(other._offers, _offers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'CompareState.success(offers: $offers)';
}


}

/// @nodoc
abstract mixin class $CompareSuccessCopyWith<$Res> implements $CompareStateCopyWith<$Res> {
  factory $CompareSuccessCopyWith(CompareSuccess value, $Res Function(CompareSuccess) _then) = _$CompareSuccessCopyWithImpl;
@useResult
$Res call({
 List<CompareOfferItem> offers
});




}
/// @nodoc
class _$CompareSuccessCopyWithImpl<$Res>
    implements $CompareSuccessCopyWith<$Res> {
  _$CompareSuccessCopyWithImpl(this._self, this._then);

  final CompareSuccess _self;
  final $Res Function(CompareSuccess) _then;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,}) {
  return _then(CompareSuccess(
null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<CompareOfferItem>,
  ));
}


}

/// @nodoc


class CompareError implements CompareState {
  const CompareError({required this.error});
  

 final  String error;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompareErrorCopyWith<CompareError> get copyWith => _$CompareErrorCopyWithImpl<CompareError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CompareState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CompareErrorCopyWith<$Res> implements $CompareStateCopyWith<$Res> {
  factory $CompareErrorCopyWith(CompareError value, $Res Function(CompareError) _then) = _$CompareErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CompareErrorCopyWithImpl<$Res>
    implements $CompareErrorCopyWith<$Res> {
  _$CompareErrorCopyWithImpl(this._self, this._then);

  final CompareError _self;
  final $Res Function(CompareError) _then;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CompareError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
