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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProposalsInitial value)?  initial,TResult Function( ProposalsLoading value)?  loading,TResult Function( ProposalsSuccess value)?  success,TResult Function( ProposalsCompareSuccess value)?  compareSuccess,TResult Function( ProposalsGenerateSuccess value)?  generateSuccess,TResult Function( ProposalsApproveSuccess value)?  approveSuccess,TResult Function( ProposalsRejectSuccess value)?  rejectSuccess,TResult Function( ProposalsStatusSuccess value)?  statusSuccess,TResult Function( ProposalsDetailSuccess value)?  detailSuccess,TResult Function( ProposalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case ProposalsSuccess() when success != null:
return success(_that);case ProposalsCompareSuccess() when compareSuccess != null:
return compareSuccess(_that);case ProposalsGenerateSuccess() when generateSuccess != null:
return generateSuccess(_that);case ProposalsApproveSuccess() when approveSuccess != null:
return approveSuccess(_that);case ProposalsRejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that);case ProposalsStatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case ProposalsDetailSuccess() when detailSuccess != null:
return detailSuccess(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProposalsInitial value)  initial,required TResult Function( ProposalsLoading value)  loading,required TResult Function( ProposalsSuccess value)  success,required TResult Function( ProposalsCompareSuccess value)  compareSuccess,required TResult Function( ProposalsGenerateSuccess value)  generateSuccess,required TResult Function( ProposalsApproveSuccess value)  approveSuccess,required TResult Function( ProposalsRejectSuccess value)  rejectSuccess,required TResult Function( ProposalsStatusSuccess value)  statusSuccess,required TResult Function( ProposalsDetailSuccess value)  detailSuccess,required TResult Function( ProposalsError value)  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial():
return initial(_that);case ProposalsLoading():
return loading(_that);case ProposalsSuccess():
return success(_that);case ProposalsCompareSuccess():
return compareSuccess(_that);case ProposalsGenerateSuccess():
return generateSuccess(_that);case ProposalsApproveSuccess():
return approveSuccess(_that);case ProposalsRejectSuccess():
return rejectSuccess(_that);case ProposalsStatusSuccess():
return statusSuccess(_that);case ProposalsDetailSuccess():
return detailSuccess(_that);case ProposalsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProposalsInitial value)?  initial,TResult? Function( ProposalsLoading value)?  loading,TResult? Function( ProposalsSuccess value)?  success,TResult? Function( ProposalsCompareSuccess value)?  compareSuccess,TResult? Function( ProposalsGenerateSuccess value)?  generateSuccess,TResult? Function( ProposalsApproveSuccess value)?  approveSuccess,TResult? Function( ProposalsRejectSuccess value)?  rejectSuccess,TResult? Function( ProposalsStatusSuccess value)?  statusSuccess,TResult? Function( ProposalsDetailSuccess value)?  detailSuccess,TResult? Function( ProposalsError value)?  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case ProposalsSuccess() when success != null:
return success(_that);case ProposalsCompareSuccess() when compareSuccess != null:
return compareSuccess(_that);case ProposalsGenerateSuccess() when generateSuccess != null:
return generateSuccess(_that);case ProposalsApproveSuccess() when approveSuccess != null:
return approveSuccess(_that);case ProposalsRejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that);case ProposalsStatusSuccess() when statusSuccess != null:
return statusSuccess(_that);case ProposalsDetailSuccess() when detailSuccess != null:
return detailSuccess(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PurchaseProposalModel> proposals)?  success,TResult Function( List<DrugComparisonModel> comparisons)?  compareSuccess,TResult Function( PurchaseProposalModel proposal)?  generateSuccess,TResult Function( PurchaseProposalModel proposal)?  approveSuccess,TResult Function( PurchaseProposalModel proposal)?  rejectSuccess,TResult Function( ProposalStatusModel status)?  statusSuccess,TResult Function( PurchaseProposalModel proposal)?  detailSuccess,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case ProposalsSuccess() when success != null:
return success(_that.proposals);case ProposalsCompareSuccess() when compareSuccess != null:
return compareSuccess(_that.comparisons);case ProposalsGenerateSuccess() when generateSuccess != null:
return generateSuccess(_that.proposal);case ProposalsApproveSuccess() when approveSuccess != null:
return approveSuccess(_that.proposal);case ProposalsRejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that.proposal);case ProposalsStatusSuccess() when statusSuccess != null:
return statusSuccess(_that.status);case ProposalsDetailSuccess() when detailSuccess != null:
return detailSuccess(_that.proposal);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PurchaseProposalModel> proposals)  success,required TResult Function( List<DrugComparisonModel> comparisons)  compareSuccess,required TResult Function( PurchaseProposalModel proposal)  generateSuccess,required TResult Function( PurchaseProposalModel proposal)  approveSuccess,required TResult Function( PurchaseProposalModel proposal)  rejectSuccess,required TResult Function( ProposalStatusModel status)  statusSuccess,required TResult Function( PurchaseProposalModel proposal)  detailSuccess,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial():
return initial();case ProposalsLoading():
return loading();case ProposalsSuccess():
return success(_that.proposals);case ProposalsCompareSuccess():
return compareSuccess(_that.comparisons);case ProposalsGenerateSuccess():
return generateSuccess(_that.proposal);case ProposalsApproveSuccess():
return approveSuccess(_that.proposal);case ProposalsRejectSuccess():
return rejectSuccess(_that.proposal);case ProposalsStatusSuccess():
return statusSuccess(_that.status);case ProposalsDetailSuccess():
return detailSuccess(_that.proposal);case ProposalsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PurchaseProposalModel> proposals)?  success,TResult? Function( List<DrugComparisonModel> comparisons)?  compareSuccess,TResult? Function( PurchaseProposalModel proposal)?  generateSuccess,TResult? Function( PurchaseProposalModel proposal)?  approveSuccess,TResult? Function( PurchaseProposalModel proposal)?  rejectSuccess,TResult? Function( ProposalStatusModel status)?  statusSuccess,TResult? Function( PurchaseProposalModel proposal)?  detailSuccess,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case ProposalsSuccess() when success != null:
return success(_that.proposals);case ProposalsCompareSuccess() when compareSuccess != null:
return compareSuccess(_that.comparisons);case ProposalsGenerateSuccess() when generateSuccess != null:
return generateSuccess(_that.proposal);case ProposalsApproveSuccess() when approveSuccess != null:
return approveSuccess(_that.proposal);case ProposalsRejectSuccess() when rejectSuccess != null:
return rejectSuccess(_that.proposal);case ProposalsStatusSuccess() when statusSuccess != null:
return statusSuccess(_that.status);case ProposalsDetailSuccess() when detailSuccess != null:
return detailSuccess(_that.proposal);case ProposalsError() when error != null:
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
  const ProposalsSuccess(final  List<PurchaseProposalModel> proposals): _proposals = proposals;
  

 final  List<PurchaseProposalModel> _proposals;
 List<PurchaseProposalModel> get proposals {
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
 List<PurchaseProposalModel> proposals
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
as List<PurchaseProposalModel>,
  ));
}


}

/// @nodoc


class ProposalsCompareSuccess implements ProposalsState {
  const ProposalsCompareSuccess(final  List<DrugComparisonModel> comparisons): _comparisons = comparisons;
  

 final  List<DrugComparisonModel> _comparisons;
 List<DrugComparisonModel> get comparisons {
  if (_comparisons is EqualUnmodifiableListView) return _comparisons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comparisons);
}


/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsCompareSuccessCopyWith<ProposalsCompareSuccess> get copyWith => _$ProposalsCompareSuccessCopyWithImpl<ProposalsCompareSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsCompareSuccess&&const DeepCollectionEquality().equals(other._comparisons, _comparisons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_comparisons));

@override
String toString() {
  return 'ProposalsState.compareSuccess(comparisons: $comparisons)';
}


}

/// @nodoc
abstract mixin class $ProposalsCompareSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsCompareSuccessCopyWith(ProposalsCompareSuccess value, $Res Function(ProposalsCompareSuccess) _then) = _$ProposalsCompareSuccessCopyWithImpl;
@useResult
$Res call({
 List<DrugComparisonModel> comparisons
});




}
/// @nodoc
class _$ProposalsCompareSuccessCopyWithImpl<$Res>
    implements $ProposalsCompareSuccessCopyWith<$Res> {
  _$ProposalsCompareSuccessCopyWithImpl(this._self, this._then);

  final ProposalsCompareSuccess _self;
  final $Res Function(ProposalsCompareSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comparisons = null,}) {
  return _then(ProposalsCompareSuccess(
null == comparisons ? _self._comparisons : comparisons // ignore: cast_nullable_to_non_nullable
as List<DrugComparisonModel>,
  ));
}


}

/// @nodoc


class ProposalsGenerateSuccess implements ProposalsState {
  const ProposalsGenerateSuccess(this.proposal);
  

 final  PurchaseProposalModel proposal;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsGenerateSuccessCopyWith<ProposalsGenerateSuccess> get copyWith => _$ProposalsGenerateSuccessCopyWithImpl<ProposalsGenerateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsGenerateSuccess&&(identical(other.proposal, proposal) || other.proposal == proposal));
}


@override
int get hashCode => Object.hash(runtimeType,proposal);

@override
String toString() {
  return 'ProposalsState.generateSuccess(proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class $ProposalsGenerateSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsGenerateSuccessCopyWith(ProposalsGenerateSuccess value, $Res Function(ProposalsGenerateSuccess) _then) = _$ProposalsGenerateSuccessCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal
});




}
/// @nodoc
class _$ProposalsGenerateSuccessCopyWithImpl<$Res>
    implements $ProposalsGenerateSuccessCopyWith<$Res> {
  _$ProposalsGenerateSuccessCopyWithImpl(this._self, this._then);

  final ProposalsGenerateSuccess _self;
  final $Res Function(ProposalsGenerateSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,}) {
  return _then(ProposalsGenerateSuccess(
null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,
  ));
}


}

/// @nodoc


class ProposalsApproveSuccess implements ProposalsState {
  const ProposalsApproveSuccess(this.proposal);
  

 final  PurchaseProposalModel proposal;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsApproveSuccessCopyWith<ProposalsApproveSuccess> get copyWith => _$ProposalsApproveSuccessCopyWithImpl<ProposalsApproveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsApproveSuccess&&(identical(other.proposal, proposal) || other.proposal == proposal));
}


@override
int get hashCode => Object.hash(runtimeType,proposal);

@override
String toString() {
  return 'ProposalsState.approveSuccess(proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class $ProposalsApproveSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsApproveSuccessCopyWith(ProposalsApproveSuccess value, $Res Function(ProposalsApproveSuccess) _then) = _$ProposalsApproveSuccessCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal
});




}
/// @nodoc
class _$ProposalsApproveSuccessCopyWithImpl<$Res>
    implements $ProposalsApproveSuccessCopyWith<$Res> {
  _$ProposalsApproveSuccessCopyWithImpl(this._self, this._then);

  final ProposalsApproveSuccess _self;
  final $Res Function(ProposalsApproveSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,}) {
  return _then(ProposalsApproveSuccess(
null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,
  ));
}


}

/// @nodoc


class ProposalsRejectSuccess implements ProposalsState {
  const ProposalsRejectSuccess(this.proposal);
  

 final  PurchaseProposalModel proposal;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsRejectSuccessCopyWith<ProposalsRejectSuccess> get copyWith => _$ProposalsRejectSuccessCopyWithImpl<ProposalsRejectSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsRejectSuccess&&(identical(other.proposal, proposal) || other.proposal == proposal));
}


@override
int get hashCode => Object.hash(runtimeType,proposal);

@override
String toString() {
  return 'ProposalsState.rejectSuccess(proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class $ProposalsRejectSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsRejectSuccessCopyWith(ProposalsRejectSuccess value, $Res Function(ProposalsRejectSuccess) _then) = _$ProposalsRejectSuccessCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal
});




}
/// @nodoc
class _$ProposalsRejectSuccessCopyWithImpl<$Res>
    implements $ProposalsRejectSuccessCopyWith<$Res> {
  _$ProposalsRejectSuccessCopyWithImpl(this._self, this._then);

  final ProposalsRejectSuccess _self;
  final $Res Function(ProposalsRejectSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,}) {
  return _then(ProposalsRejectSuccess(
null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,
  ));
}


}

/// @nodoc


class ProposalsStatusSuccess implements ProposalsState {
  const ProposalsStatusSuccess(this.status);
  

 final  ProposalStatusModel status;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsStatusSuccessCopyWith<ProposalsStatusSuccess> get copyWith => _$ProposalsStatusSuccessCopyWithImpl<ProposalsStatusSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsStatusSuccess&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'ProposalsState.statusSuccess(status: $status)';
}


}

/// @nodoc
abstract mixin class $ProposalsStatusSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsStatusSuccessCopyWith(ProposalsStatusSuccess value, $Res Function(ProposalsStatusSuccess) _then) = _$ProposalsStatusSuccessCopyWithImpl;
@useResult
$Res call({
 ProposalStatusModel status
});




}
/// @nodoc
class _$ProposalsStatusSuccessCopyWithImpl<$Res>
    implements $ProposalsStatusSuccessCopyWith<$Res> {
  _$ProposalsStatusSuccessCopyWithImpl(this._self, this._then);

  final ProposalsStatusSuccess _self;
  final $Res Function(ProposalsStatusSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(ProposalsStatusSuccess(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposalStatusModel,
  ));
}


}

/// @nodoc


class ProposalsDetailSuccess implements ProposalsState {
  const ProposalsDetailSuccess(this.proposal);
  

 final  PurchaseProposalModel proposal;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProposalsDetailSuccessCopyWith<ProposalsDetailSuccess> get copyWith => _$ProposalsDetailSuccessCopyWithImpl<ProposalsDetailSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProposalsDetailSuccess&&(identical(other.proposal, proposal) || other.proposal == proposal));
}


@override
int get hashCode => Object.hash(runtimeType,proposal);

@override
String toString() {
  return 'ProposalsState.detailSuccess(proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class $ProposalsDetailSuccessCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $ProposalsDetailSuccessCopyWith(ProposalsDetailSuccess value, $Res Function(ProposalsDetailSuccess) _then) = _$ProposalsDetailSuccessCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal
});




}
/// @nodoc
class _$ProposalsDetailSuccessCopyWithImpl<$Res>
    implements $ProposalsDetailSuccessCopyWith<$Res> {
  _$ProposalsDetailSuccessCopyWithImpl(this._self, this._then);

  final ProposalsDetailSuccess _self;
  final $Res Function(ProposalsDetailSuccess) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,}) {
  return _then(ProposalsDetailSuccess(
null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,
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
