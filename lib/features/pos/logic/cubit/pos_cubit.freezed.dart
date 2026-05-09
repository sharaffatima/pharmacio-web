// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PosState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosState()';
}


}

/// @nodoc
class $PosStateCopyWith<$Res>  {
$PosStateCopyWith(PosState _, $Res Function(PosState) __);
}


/// Adds pattern-matching-related methods to [PosState].
extension PosStatePatterns on PosState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PosInitial value)?  initial,TResult Function( PosLoading value)?  loading,TResult Function( SuccessGetTransactions value)?  successGetTransactions,TResult Function( SuccessCheckout value)?  successCheckout,TResult Function( SuccessRefund value)?  successRefund,TResult Function( SuccessGetReceipt value)?  successGetReceipt,TResult Function( PosError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PosInitial() when initial != null:
return initial(_that);case PosLoading() when loading != null:
return loading(_that);case SuccessGetTransactions() when successGetTransactions != null:
return successGetTransactions(_that);case SuccessCheckout() when successCheckout != null:
return successCheckout(_that);case SuccessRefund() when successRefund != null:
return successRefund(_that);case SuccessGetReceipt() when successGetReceipt != null:
return successGetReceipt(_that);case PosError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PosInitial value)  initial,required TResult Function( PosLoading value)  loading,required TResult Function( SuccessGetTransactions value)  successGetTransactions,required TResult Function( SuccessCheckout value)  successCheckout,required TResult Function( SuccessRefund value)  successRefund,required TResult Function( SuccessGetReceipt value)  successGetReceipt,required TResult Function( PosError value)  error,}){
final _that = this;
switch (_that) {
case PosInitial():
return initial(_that);case PosLoading():
return loading(_that);case SuccessGetTransactions():
return successGetTransactions(_that);case SuccessCheckout():
return successCheckout(_that);case SuccessRefund():
return successRefund(_that);case SuccessGetReceipt():
return successGetReceipt(_that);case PosError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PosInitial value)?  initial,TResult? Function( PosLoading value)?  loading,TResult? Function( SuccessGetTransactions value)?  successGetTransactions,TResult? Function( SuccessCheckout value)?  successCheckout,TResult? Function( SuccessRefund value)?  successRefund,TResult? Function( SuccessGetReceipt value)?  successGetReceipt,TResult? Function( PosError value)?  error,}){
final _that = this;
switch (_that) {
case PosInitial() when initial != null:
return initial(_that);case PosLoading() when loading != null:
return loading(_that);case SuccessGetTransactions() when successGetTransactions != null:
return successGetTransactions(_that);case SuccessCheckout() when successCheckout != null:
return successCheckout(_that);case SuccessRefund() when successRefund != null:
return successRefund(_that);case SuccessGetReceipt() when successGetReceipt != null:
return successGetReceipt(_that);case PosError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PosTransactionResponse> transactions)?  successGetTransactions,TResult Function( PosTransactionResponse transaction)?  successCheckout,TResult Function( PosTransactionResponse transaction)?  successRefund,TResult Function( PosTransactionResponse receipt)?  successGetReceipt,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PosInitial() when initial != null:
return initial();case PosLoading() when loading != null:
return loading();case SuccessGetTransactions() when successGetTransactions != null:
return successGetTransactions(_that.transactions);case SuccessCheckout() when successCheckout != null:
return successCheckout(_that.transaction);case SuccessRefund() when successRefund != null:
return successRefund(_that.transaction);case SuccessGetReceipt() when successGetReceipt != null:
return successGetReceipt(_that.receipt);case PosError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PosTransactionResponse> transactions)  successGetTransactions,required TResult Function( PosTransactionResponse transaction)  successCheckout,required TResult Function( PosTransactionResponse transaction)  successRefund,required TResult Function( PosTransactionResponse receipt)  successGetReceipt,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case PosInitial():
return initial();case PosLoading():
return loading();case SuccessGetTransactions():
return successGetTransactions(_that.transactions);case SuccessCheckout():
return successCheckout(_that.transaction);case SuccessRefund():
return successRefund(_that.transaction);case SuccessGetReceipt():
return successGetReceipt(_that.receipt);case PosError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PosTransactionResponse> transactions)?  successGetTransactions,TResult? Function( PosTransactionResponse transaction)?  successCheckout,TResult? Function( PosTransactionResponse transaction)?  successRefund,TResult? Function( PosTransactionResponse receipt)?  successGetReceipt,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case PosInitial() when initial != null:
return initial();case PosLoading() when loading != null:
return loading();case SuccessGetTransactions() when successGetTransactions != null:
return successGetTransactions(_that.transactions);case SuccessCheckout() when successCheckout != null:
return successCheckout(_that.transaction);case SuccessRefund() when successRefund != null:
return successRefund(_that.transaction);case SuccessGetReceipt() when successGetReceipt != null:
return successGetReceipt(_that.receipt);case PosError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PosInitial implements PosState {
  const PosInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosState.initial()';
}


}




/// @nodoc


class PosLoading implements PosState {
  const PosLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PosState.loading()';
}


}




/// @nodoc


class SuccessGetTransactions implements PosState {
  const SuccessGetTransactions(final  List<PosTransactionResponse> transactions): _transactions = transactions;
  

 final  List<PosTransactionResponse> _transactions;
 List<PosTransactionResponse> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}


/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetTransactionsCopyWith<SuccessGetTransactions> get copyWith => _$SuccessGetTransactionsCopyWithImpl<SuccessGetTransactions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetTransactions&&const DeepCollectionEquality().equals(other._transactions, _transactions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_transactions));

@override
String toString() {
  return 'PosState.successGetTransactions(transactions: $transactions)';
}


}

/// @nodoc
abstract mixin class $SuccessGetTransactionsCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory $SuccessGetTransactionsCopyWith(SuccessGetTransactions value, $Res Function(SuccessGetTransactions) _then) = _$SuccessGetTransactionsCopyWithImpl;
@useResult
$Res call({
 List<PosTransactionResponse> transactions
});




}
/// @nodoc
class _$SuccessGetTransactionsCopyWithImpl<$Res>
    implements $SuccessGetTransactionsCopyWith<$Res> {
  _$SuccessGetTransactionsCopyWithImpl(this._self, this._then);

  final SuccessGetTransactions _self;
  final $Res Function(SuccessGetTransactions) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transactions = null,}) {
  return _then(SuccessGetTransactions(
null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<PosTransactionResponse>,
  ));
}


}

/// @nodoc


class SuccessCheckout implements PosState {
  const SuccessCheckout(this.transaction);
  

 final  PosTransactionResponse transaction;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCheckoutCopyWith<SuccessCheckout> get copyWith => _$SuccessCheckoutCopyWithImpl<SuccessCheckout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCheckout&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'PosState.successCheckout(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $SuccessCheckoutCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory $SuccessCheckoutCopyWith(SuccessCheckout value, $Res Function(SuccessCheckout) _then) = _$SuccessCheckoutCopyWithImpl;
@useResult
$Res call({
 PosTransactionResponse transaction
});




}
/// @nodoc
class _$SuccessCheckoutCopyWithImpl<$Res>
    implements $SuccessCheckoutCopyWith<$Res> {
  _$SuccessCheckoutCopyWithImpl(this._self, this._then);

  final SuccessCheckout _self;
  final $Res Function(SuccessCheckout) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(SuccessCheckout(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as PosTransactionResponse,
  ));
}


}

/// @nodoc


class SuccessRefund implements PosState {
  const SuccessRefund(this.transaction);
  

 final  PosTransactionResponse transaction;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessRefundCopyWith<SuccessRefund> get copyWith => _$SuccessRefundCopyWithImpl<SuccessRefund>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRefund&&(identical(other.transaction, transaction) || other.transaction == transaction));
}


@override
int get hashCode => Object.hash(runtimeType,transaction);

@override
String toString() {
  return 'PosState.successRefund(transaction: $transaction)';
}


}

/// @nodoc
abstract mixin class $SuccessRefundCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory $SuccessRefundCopyWith(SuccessRefund value, $Res Function(SuccessRefund) _then) = _$SuccessRefundCopyWithImpl;
@useResult
$Res call({
 PosTransactionResponse transaction
});




}
/// @nodoc
class _$SuccessRefundCopyWithImpl<$Res>
    implements $SuccessRefundCopyWith<$Res> {
  _$SuccessRefundCopyWithImpl(this._self, this._then);

  final SuccessRefund _self;
  final $Res Function(SuccessRefund) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,}) {
  return _then(SuccessRefund(
null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as PosTransactionResponse,
  ));
}


}

/// @nodoc


class SuccessGetReceipt implements PosState {
  const SuccessGetReceipt(this.receipt);
  

 final  PosTransactionResponse receipt;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetReceiptCopyWith<SuccessGetReceipt> get copyWith => _$SuccessGetReceiptCopyWithImpl<SuccessGetReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetReceipt&&(identical(other.receipt, receipt) || other.receipt == receipt));
}


@override
int get hashCode => Object.hash(runtimeType,receipt);

@override
String toString() {
  return 'PosState.successGetReceipt(receipt: $receipt)';
}


}

/// @nodoc
abstract mixin class $SuccessGetReceiptCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory $SuccessGetReceiptCopyWith(SuccessGetReceipt value, $Res Function(SuccessGetReceipt) _then) = _$SuccessGetReceiptCopyWithImpl;
@useResult
$Res call({
 PosTransactionResponse receipt
});




}
/// @nodoc
class _$SuccessGetReceiptCopyWithImpl<$Res>
    implements $SuccessGetReceiptCopyWith<$Res> {
  _$SuccessGetReceiptCopyWithImpl(this._self, this._then);

  final SuccessGetReceipt _self;
  final $Res Function(SuccessGetReceipt) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? receipt = null,}) {
  return _then(SuccessGetReceipt(
null == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as PosTransactionResponse,
  ));
}


}

/// @nodoc


class PosError implements PosState {
  const PosError({required this.error});
  

 final  String error;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PosErrorCopyWith<PosError> get copyWith => _$PosErrorCopyWithImpl<PosError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PosError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PosState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PosErrorCopyWith<$Res> implements $PosStateCopyWith<$Res> {
  factory $PosErrorCopyWith(PosError value, $Res Function(PosError) _then) = _$PosErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PosErrorCopyWithImpl<$Res>
    implements $PosErrorCopyWith<$Res> {
  _$PosErrorCopyWithImpl(this._self, this._then);

  final PosError _self;
  final $Res Function(PosError) _then;

/// Create a copy of PosState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PosError(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
