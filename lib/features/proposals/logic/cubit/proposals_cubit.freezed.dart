// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'proposals_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProposalsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState()';
}


}

/// @nodoc
class $ProposalsStateCopyWith<$Res>  {
$ProposalsStateCopyWith(ProposalsState _, $Res Function(ProposalsState) __);
}


/// Adds pattern-matching-related methods to [ProposalsState].
extension ProposalsStatePatterns on ProposalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProposalsInitial value)?  initial,TResult Function( ProposalsLoading value)?  loading,TResult Function( ProposalsSuccess value)?  success,TResult Function( ProposalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case ProposalsSuccess() when success != null:
return success(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProposalsInitial value)  initial,required TResult Function( ProposalsLoading value)  loading,required TResult Function( ProposalsSuccess value)  success,required TResult Function( ProposalsError value)  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial():
return initial(_that);case ProposalsLoading():
return loading(_that);case ProposalsSuccess():
return success(_that);case ProposalsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProposalsInitial value)?  initial,TResult? Function( ProposalsLoading value)?  loading,TResult? Function( ProposalsSuccess value)?  success,TResult? Function( ProposalsError value)?  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case ProposalsSuccess() when success != null:
return success(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProposalEntry> proposals)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case ProposalsSuccess() when success != null:
return success(_that.proposals);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProposalEntry> proposals)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial():
return initial();case ProposalsLoading():
return loading();case ProposalsSuccess():
return success(_that.proposals);case ProposalsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProposalEntry> proposals)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case ProposalsSuccess() when success != null:
return success(_that.proposals);case ProposalsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ProposalsInitial implements ProposalsState {
  const ProposalsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.initial()';
}


}




/// @nodoc


class ProposalsLoading implements ProposalsState {
  const ProposalsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProposalsState.loading()';
}


}




/// @nodoc


class ProposalsSuccess implements ProposalsState {
  const ProposalsSuccess(final  List<ProposalEntry> proposals): _proposals = proposals;
  

 final  List<ProposalEntry> _proposals;
 List<ProposalEntry> get proposals {
  if (_proposals is EqualUnmodifiableListView) return _proposals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_proposals);
}


/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsSuccessCopyWith<ProposalsSuccess> get copyWith => _$ProposalsSuccessCopyWithImpl<ProposalsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsSuccess&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.success(proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $ProposalsSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsSuccessCopyWith(ProposalsSuccess value, $Res Function(ProposalsSuccess) _then) = _$ProposalsSuccessCopyWithImpl;
@useResult
$Res call({
 List<ProposalEntry> proposals
});




}
/// @nodoc
class _$ProposalsSuccessCopyWithImpl<$Res>
    implements $ProposalsSuccessCopyWith<$Res> {
  _$ProposalsSuccessCopyWithImpl(this._self, this._then);

  final ProposalsSuccess _self;
  final $Res Function(ProposalsSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposals = null,}) {
  return _then(ProposalsSuccess(
null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<ProposalEntry>,
  ));
}


}

/// @nodoc


class ProposalsError implements ProposalsState {
  const ProposalsError({required this.error});
  

 final  String error;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsErrorCopyWith<ProposalsError> get copyWith => _$ProposalsErrorCopyWithImpl<ProposalsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ProposalsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ProposalsErrorCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsErrorCopyWith(ProposalsError value, $Res Function(ProposalsError) _then) = _$ProposalsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ProposalsErrorCopyWithImpl<$Res>
    implements $ProposalsErrorCopyWith<$Res> {
  _$ProposalsErrorCopyWithImpl(this._self, this._then);

  final ProposalsError _self;
  final $Res Function(ProposalsError) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ProposalsError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
