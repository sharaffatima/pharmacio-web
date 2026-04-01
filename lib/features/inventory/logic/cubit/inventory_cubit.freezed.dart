// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState()';
}


}

/// @nodoc
class $InventoryStateCopyWith<$Res>  {
$InventoryStateCopyWith(InventoryState _, $Res Function(InventoryState) __);
}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InventoryInitial value)?  initial,TResult Function( InventoryLoading value)?  loading,TResult Function( InventorySuccess value)?  success,TResult Function( InventoryCreateSuccess value)?  createSuccess,TResult Function( InventoryAdjustSuccess value)?  adjustSuccess,TResult Function( InventorySaleSuccess value)?  saleSuccess,TResult Function( InventoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InventoryInitial() when initial != null:
return initial(_that);case InventoryLoading() when loading != null:
return loading(_that);case InventorySuccess() when success != null:
return success(_that);case InventoryCreateSuccess() when createSuccess != null:
return createSuccess(_that);case InventoryAdjustSuccess() when adjustSuccess != null:
return adjustSuccess(_that);case InventorySaleSuccess() when saleSuccess != null:
return saleSuccess(_that);case InventoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InventoryInitial value)  initial,required TResult Function( InventoryLoading value)  loading,required TResult Function( InventorySuccess value)  success,required TResult Function( InventoryCreateSuccess value)  createSuccess,required TResult Function( InventoryAdjustSuccess value)  adjustSuccess,required TResult Function( InventorySaleSuccess value)  saleSuccess,required TResult Function( InventoryError value)  error,}){
final _that = this;
switch (_that) {
case InventoryInitial():
return initial(_that);case InventoryLoading():
return loading(_that);case InventorySuccess():
return success(_that);case InventoryCreateSuccess():
return createSuccess(_that);case InventoryAdjustSuccess():
return adjustSuccess(_that);case InventorySaleSuccess():
return saleSuccess(_that);case InventoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InventoryInitial value)?  initial,TResult? Function( InventoryLoading value)?  loading,TResult? Function( InventorySuccess value)?  success,TResult? Function( InventoryCreateSuccess value)?  createSuccess,TResult? Function( InventoryAdjustSuccess value)?  adjustSuccess,TResult? Function( InventorySaleSuccess value)?  saleSuccess,TResult? Function( InventoryError value)?  error,}){
final _that = this;
switch (_that) {
case InventoryInitial() when initial != null:
return initial(_that);case InventoryLoading() when loading != null:
return loading(_that);case InventorySuccess() when success != null:
return success(_that);case InventoryCreateSuccess() when createSuccess != null:
return createSuccess(_that);case InventoryAdjustSuccess() when adjustSuccess != null:
return adjustSuccess(_that);case InventorySaleSuccess() when saleSuccess != null:
return saleSuccess(_that);case InventoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<InventoryItemResponse> items)?  success,TResult Function( InventoryItemResponse item)?  createSuccess,TResult Function( InventoryAdjustResponse response)?  adjustSuccess,TResult Function( SaleResponse response)?  saleSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InventoryInitial() when initial != null:
return initial();case InventoryLoading() when loading != null:
return loading();case InventorySuccess() when success != null:
return success(_that.items);case InventoryCreateSuccess() when createSuccess != null:
return createSuccess(_that.item);case InventoryAdjustSuccess() when adjustSuccess != null:
return adjustSuccess(_that.response);case InventorySaleSuccess() when saleSuccess != null:
return saleSuccess(_that.response);case InventoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<InventoryItemResponse> items)  success,required TResult Function( InventoryItemResponse item)  createSuccess,required TResult Function( InventoryAdjustResponse response)  adjustSuccess,required TResult Function( SaleResponse response)  saleSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case InventoryInitial():
return initial();case InventoryLoading():
return loading();case InventorySuccess():
return success(_that.items);case InventoryCreateSuccess():
return createSuccess(_that.item);case InventoryAdjustSuccess():
return adjustSuccess(_that.response);case InventorySaleSuccess():
return saleSuccess(_that.response);case InventoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<InventoryItemResponse> items)?  success,TResult? Function( InventoryItemResponse item)?  createSuccess,TResult? Function( InventoryAdjustResponse response)?  adjustSuccess,TResult? Function( SaleResponse response)?  saleSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case InventoryInitial() when initial != null:
return initial();case InventoryLoading() when loading != null:
return loading();case InventorySuccess() when success != null:
return success(_that.items);case InventoryCreateSuccess() when createSuccess != null:
return createSuccess(_that.item);case InventoryAdjustSuccess() when adjustSuccess != null:
return adjustSuccess(_that.response);case InventorySaleSuccess() when saleSuccess != null:
return saleSuccess(_that.response);case InventoryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class InventoryInitial implements InventoryState {
  const InventoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.initial()';
}


}




/// @nodoc


class InventoryLoading implements InventoryState {
  const InventoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryState.loading()';
}


}




/// @nodoc


class InventorySuccess implements InventoryState {
  const InventorySuccess(final  List<InventoryItemResponse> items): _items = items;
  

 final  List<InventoryItemResponse> _items;
 List<InventoryItemResponse> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventorySuccessCopyWith<InventorySuccess> get copyWith => _$InventorySuccessCopyWithImpl<InventorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventorySuccess&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'InventoryState.success(items: $items)';
}


}

/// @nodoc
abstract mixin class $InventorySuccessCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventorySuccessCopyWith(InventorySuccess value, $Res Function(InventorySuccess) _then) = _$InventorySuccessCopyWithImpl;
@useResult
$Res call({
 List<InventoryItemResponse> items
});




}
/// @nodoc
class _$InventorySuccessCopyWithImpl<$Res>
    implements $InventorySuccessCopyWith<$Res> {
  _$InventorySuccessCopyWithImpl(this._self, this._then);

  final InventorySuccess _self;
  final $Res Function(InventorySuccess) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(InventorySuccess(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<InventoryItemResponse>,
  ));
}


}

/// @nodoc


class InventoryCreateSuccess implements InventoryState {
  const InventoryCreateSuccess(this.item);
  

 final  InventoryItemResponse item;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryCreateSuccessCopyWith<InventoryCreateSuccess> get copyWith => _$InventoryCreateSuccessCopyWithImpl<InventoryCreateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryCreateSuccess&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'InventoryState.createSuccess(item: $item)';
}


}

/// @nodoc
abstract mixin class $InventoryCreateSuccessCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryCreateSuccessCopyWith(InventoryCreateSuccess value, $Res Function(InventoryCreateSuccess) _then) = _$InventoryCreateSuccessCopyWithImpl;
@useResult
$Res call({
 InventoryItemResponse item
});




}
/// @nodoc
class _$InventoryCreateSuccessCopyWithImpl<$Res>
    implements $InventoryCreateSuccessCopyWith<$Res> {
  _$InventoryCreateSuccessCopyWithImpl(this._self, this._then);

  final InventoryCreateSuccess _self;
  final $Res Function(InventoryCreateSuccess) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(InventoryCreateSuccess(
null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as InventoryItemResponse,
  ));
}


}

/// @nodoc


class InventoryAdjustSuccess implements InventoryState {
  const InventoryAdjustSuccess(this.response);
  

 final  InventoryAdjustResponse response;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryAdjustSuccessCopyWith<InventoryAdjustSuccess> get copyWith => _$InventoryAdjustSuccessCopyWithImpl<InventoryAdjustSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryAdjustSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'InventoryState.adjustSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $InventoryAdjustSuccessCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryAdjustSuccessCopyWith(InventoryAdjustSuccess value, $Res Function(InventoryAdjustSuccess) _then) = _$InventoryAdjustSuccessCopyWithImpl;
@useResult
$Res call({
 InventoryAdjustResponse response
});




}
/// @nodoc
class _$InventoryAdjustSuccessCopyWithImpl<$Res>
    implements $InventoryAdjustSuccessCopyWith<$Res> {
  _$InventoryAdjustSuccessCopyWithImpl(this._self, this._then);

  final InventoryAdjustSuccess _self;
  final $Res Function(InventoryAdjustSuccess) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(InventoryAdjustSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as InventoryAdjustResponse,
  ));
}


}

/// @nodoc


class InventorySaleSuccess implements InventoryState {
  const InventorySaleSuccess(this.response);
  

 final  SaleResponse response;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventorySaleSuccessCopyWith<InventorySaleSuccess> get copyWith => _$InventorySaleSuccessCopyWithImpl<InventorySaleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventorySaleSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'InventoryState.saleSuccess(response: $response)';
}


}

/// @nodoc
abstract mixin class $InventorySaleSuccessCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventorySaleSuccessCopyWith(InventorySaleSuccess value, $Res Function(InventorySaleSuccess) _then) = _$InventorySaleSuccessCopyWithImpl;
@useResult
$Res call({
 SaleResponse response
});




}
/// @nodoc
class _$InventorySaleSuccessCopyWithImpl<$Res>
    implements $InventorySaleSuccessCopyWith<$Res> {
  _$InventorySaleSuccessCopyWithImpl(this._self, this._then);

  final InventorySaleSuccess _self;
  final $Res Function(InventorySaleSuccess) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(InventorySaleSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as SaleResponse,
  ));
}


}

/// @nodoc


class InventoryError implements InventoryState {
  const InventoryError({required this.error});
  

 final  String error;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryErrorCopyWith<InventoryError> get copyWith => _$InventoryErrorCopyWithImpl<InventoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'InventoryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $InventoryErrorCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory $InventoryErrorCopyWith(InventoryError value, $Res Function(InventoryError) _then) = _$InventoryErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$InventoryErrorCopyWithImpl<$Res>
    implements $InventoryErrorCopyWith<$Res> {
  _$InventoryErrorCopyWithImpl(this._self, this._then);

  final InventoryError _self;
  final $Res Function(InventoryError) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(InventoryError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
