// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OffersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState()';
}


}

/// @nodoc
class $OffersStateCopyWith<$Res>  {
$OffersStateCopyWith(OffersState _, $Res Function(OffersState) __);
}


/// Adds pattern-matching-related methods to [OffersState].
extension OffersStatePatterns on OffersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OffersInitial value)?  initial,TResult Function( OffersLoading value)?  loading,TResult Function( SuccessGetAvailableOffers value)?  successGetAvailableOffers,TResult Function( OffersError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OffersInitial() when initial != null:
return initial(_that);case OffersLoading() when loading != null:
return loading(_that);case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that);case OffersError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OffersInitial value)  initial,required TResult Function( OffersLoading value)  loading,required TResult Function( SuccessGetAvailableOffers value)  successGetAvailableOffers,required TResult Function( OffersError value)  error,}){
final _that = this;
switch (_that) {
case OffersInitial():
return initial(_that);case OffersLoading():
return loading(_that);case SuccessGetAvailableOffers():
return successGetAvailableOffers(_that);case OffersError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OffersInitial value)?  initial,TResult? Function( OffersLoading value)?  loading,TResult? Function( SuccessGetAvailableOffers value)?  successGetAvailableOffers,TResult? Function( OffersError value)?  error,}){
final _that = this;
switch (_that) {
case OffersInitial() when initial != null:
return initial(_that);case OffersLoading() when loading != null:
return loading(_that);case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that);case OffersError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<AvailableOfferItem> offers)?  successGetAvailableOffers,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OffersInitial() when initial != null:
return initial();case OffersLoading() when loading != null:
return loading();case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that.offers);case OffersError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<AvailableOfferItem> offers)  successGetAvailableOffers,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case OffersInitial():
return initial();case OffersLoading():
return loading();case SuccessGetAvailableOffers():
return successGetAvailableOffers(_that.offers);case OffersError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<AvailableOfferItem> offers)?  successGetAvailableOffers,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case OffersInitial() when initial != null:
return initial();case OffersLoading() when loading != null:
return loading();case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that.offers);case OffersError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class OffersInitial implements OffersState {
  const OffersInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState.initial()';
}


}




/// @nodoc


class OffersLoading implements OffersState {
  const OffersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OffersState.loading()';
}


}




/// @nodoc


class SuccessGetAvailableOffers implements OffersState {
  const SuccessGetAvailableOffers(final  List<AvailableOfferItem> offers): _offers = offers;
  

 final  List<AvailableOfferItem> _offers;
 List<AvailableOfferItem> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}


/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetAvailableOffersCopyWith<SuccessGetAvailableOffers> get copyWith => _$SuccessGetAvailableOffersCopyWithImpl<SuccessGetAvailableOffers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetAvailableOffers&&const DeepCollectionEquality().equals(other._offers, _offers));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers));

@override
String toString() {
  return 'OffersState.successGetAvailableOffers(offers: $offers)';
}


}

/// @nodoc
abstract mixin class $SuccessGetAvailableOffersCopyWith<$Res> implements $OffersStateCopyWith<$Res> {
  factory $SuccessGetAvailableOffersCopyWith(SuccessGetAvailableOffers value, $Res Function(SuccessGetAvailableOffers) _then) = _$SuccessGetAvailableOffersCopyWithImpl;
@useResult
$Res call({
 List<AvailableOfferItem> offers
});




}
/// @nodoc
class _$SuccessGetAvailableOffersCopyWithImpl<$Res>
    implements $SuccessGetAvailableOffersCopyWith<$Res> {
  _$SuccessGetAvailableOffersCopyWithImpl(this._self, this._then);

  final SuccessGetAvailableOffers _self;
  final $Res Function(SuccessGetAvailableOffers) _then;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,}) {
  return _then(SuccessGetAvailableOffers(
null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<AvailableOfferItem>,
  ));
}


}

/// @nodoc


class OffersError implements OffersState {
  const OffersError({required this.error});
  

 final  String error;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OffersErrorCopyWith<OffersError> get copyWith => _$OffersErrorCopyWithImpl<OffersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OffersError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'OffersState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $OffersErrorCopyWith<$Res> implements $OffersStateCopyWith<$Res> {
  factory $OffersErrorCopyWith(OffersError value, $Res Function(OffersError) _then) = _$OffersErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$OffersErrorCopyWithImpl<$Res>
    implements $OffersErrorCopyWith<$Res> {
  _$OffersErrorCopyWithImpl(this._self, this._then);

  final OffersError _self;
  final $Res Function(OffersError) _then;

/// Create a copy of OffersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(OffersError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
