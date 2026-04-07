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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProposalsInitial value)?  initial,TResult Function( ProposalsLoading value)?  loading,TResult Function( SuccessGetProposalsList value)?  successGetProposalsList,TResult Function( SuccessGetProposalDetail value)?  successGetProposalDetail,TResult Function( SuccessGetProposalStatus value)?  successGetProposalStatus,TResult Function( SuccessApproveProposal value)?  successApproveProposal,TResult Function( SuccessRejectProposal value)?  successRejectProposal,TResult Function( ProposalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case SuccessGetProposalsList() when successGetProposalsList != null:
return successGetProposalsList(_that);case SuccessGetProposalDetail() when successGetProposalDetail != null:
return successGetProposalDetail(_that);case SuccessGetProposalStatus() when successGetProposalStatus != null:
return successGetProposalStatus(_that);case SuccessApproveProposal() when successApproveProposal != null:
return successApproveProposal(_that);case SuccessRejectProposal() when successRejectProposal != null:
return successRejectProposal(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProposalsInitial value)  initial,required TResult Function( ProposalsLoading value)  loading,required TResult Function( SuccessGetProposalsList value)  successGetProposalsList,required TResult Function( SuccessGetProposalDetail value)  successGetProposalDetail,required TResult Function( SuccessGetProposalStatus value)  successGetProposalStatus,required TResult Function( SuccessApproveProposal value)  successApproveProposal,required TResult Function( SuccessRejectProposal value)  successRejectProposal,required TResult Function( ProposalsError value)  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial():
return initial(_that);case ProposalsLoading():
return loading(_that);case SuccessGetProposalsList():
return successGetProposalsList(_that);case SuccessGetProposalDetail():
return successGetProposalDetail(_that);case SuccessGetProposalStatus():
return successGetProposalStatus(_that);case SuccessApproveProposal():
return successApproveProposal(_that);case SuccessRejectProposal():
return successRejectProposal(_that);case ProposalsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProposalsInitial value)?  initial,TResult? Function( ProposalsLoading value)?  loading,TResult? Function( SuccessGetProposalsList value)?  successGetProposalsList,TResult? Function( SuccessGetProposalDetail value)?  successGetProposalDetail,TResult? Function( SuccessGetProposalStatus value)?  successGetProposalStatus,TResult? Function( SuccessApproveProposal value)?  successApproveProposal,TResult? Function( SuccessRejectProposal value)?  successRejectProposal,TResult? Function( ProposalsError value)?  error,}){
final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial(_that);case ProposalsLoading() when loading != null:
return loading(_that);case SuccessGetProposalsList() when successGetProposalsList != null:
return successGetProposalsList(_that);case SuccessGetProposalDetail() when successGetProposalDetail != null:
return successGetProposalDetail(_that);case SuccessGetProposalStatus() when successGetProposalStatus != null:
return successGetProposalStatus(_that);case SuccessApproveProposal() when successApproveProposal != null:
return successApproveProposal(_that);case SuccessRejectProposal() when successRejectProposal != null:
return successRejectProposal(_that);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<PurchaseProposalModel> proposals)?  successGetProposalsList,TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successGetProposalDetail,TResult Function( ProposalStatusResponse status,  List<PurchaseProposalModel> proposals)?  successGetProposalStatus,TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successApproveProposal,TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successRejectProposal,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case SuccessGetProposalsList() when successGetProposalsList != null:
return successGetProposalsList(_that.proposals);case SuccessGetProposalDetail() when successGetProposalDetail != null:
return successGetProposalDetail(_that.proposal,_that.proposals);case SuccessGetProposalStatus() when successGetProposalStatus != null:
return successGetProposalStatus(_that.status,_that.proposals);case SuccessApproveProposal() when successApproveProposal != null:
return successApproveProposal(_that.proposal,_that.proposals);case SuccessRejectProposal() when successRejectProposal != null:
return successRejectProposal(_that.proposal,_that.proposals);case ProposalsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<PurchaseProposalModel> proposals)  successGetProposalsList,required TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)  successGetProposalDetail,required TResult Function( ProposalStatusResponse status,  List<PurchaseProposalModel> proposals)  successGetProposalStatus,required TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)  successApproveProposal,required TResult Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)  successRejectProposal,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial():
return initial();case ProposalsLoading():
return loading();case SuccessGetProposalsList():
return successGetProposalsList(_that.proposals);case SuccessGetProposalDetail():
return successGetProposalDetail(_that.proposal,_that.proposals);case SuccessGetProposalStatus():
return successGetProposalStatus(_that.status,_that.proposals);case SuccessApproveProposal():
return successApproveProposal(_that.proposal,_that.proposals);case SuccessRejectProposal():
return successRejectProposal(_that.proposal,_that.proposals);case ProposalsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<PurchaseProposalModel> proposals)?  successGetProposalsList,TResult? Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successGetProposalDetail,TResult? Function( ProposalStatusResponse status,  List<PurchaseProposalModel> proposals)?  successGetProposalStatus,TResult? Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successApproveProposal,TResult? Function( PurchaseProposalModel proposal,  List<PurchaseProposalModel> proposals)?  successRejectProposal,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case ProposalsInitial() when initial != null:
return initial();case ProposalsLoading() when loading != null:
return loading();case SuccessGetProposalsList() when successGetProposalsList != null:
return successGetProposalsList(_that.proposals);case SuccessGetProposalDetail() when successGetProposalDetail != null:
return successGetProposalDetail(_that.proposal,_that.proposals);case SuccessGetProposalStatus() when successGetProposalStatus != null:
return successGetProposalStatus(_that.status,_that.proposals);case SuccessApproveProposal() when successApproveProposal != null:
return successApproveProposal(_that.proposal,_that.proposals);case SuccessRejectProposal() when successRejectProposal != null:
return successRejectProposal(_that.proposal,_that.proposals);case ProposalsError() when error != null:
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


class SuccessGetProposalsList implements ProposalsState {
  const SuccessGetProposalsList(final  List<PurchaseProposalModel> proposals): _proposals = proposals;
  

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
$SuccessGetProposalsListCopyWith<SuccessGetProposalsList> get copyWith => _$SuccessGetProposalsListCopyWithImpl<SuccessGetProposalsList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetProposalsList&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.successGetProposalsList(proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $SuccessGetProposalsListCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $SuccessGetProposalsListCopyWith(SuccessGetProposalsList value, $Res Function(SuccessGetProposalsList) _then) = _$SuccessGetProposalsListCopyWithImpl;
@useResult
$Res call({
 List<PurchaseProposalModel> proposals
});




}
/// @nodoc
class _$SuccessGetProposalsListCopyWithImpl<$Res>
    implements $SuccessGetProposalsListCopyWith<$Res> {
  _$SuccessGetProposalsListCopyWithImpl(this._self, this._then);

  final SuccessGetProposalsList _self;
  final $Res Function(SuccessGetProposalsList) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposals = null,}) {
  return _then(SuccessGetProposalsList(
null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<PurchaseProposalModel>,
  ));
}


}

/// @nodoc


class SuccessGetProposalDetail implements ProposalsState {
  const SuccessGetProposalDetail({required this.proposal, required final  List<PurchaseProposalModel> proposals}): _proposals = proposals;
  

 final  PurchaseProposalModel proposal;
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
$SuccessGetProposalDetailCopyWith<SuccessGetProposalDetail> get copyWith => _$SuccessGetProposalDetailCopyWithImpl<SuccessGetProposalDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetProposalDetail&&(identical(other.proposal, proposal) || other.proposal == proposal)&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,proposal,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.successGetProposalDetail(proposal: $proposal, proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $SuccessGetProposalDetailCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $SuccessGetProposalDetailCopyWith(SuccessGetProposalDetail value, $Res Function(SuccessGetProposalDetail) _then) = _$SuccessGetProposalDetailCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal, List<PurchaseProposalModel> proposals
});




}
/// @nodoc
class _$SuccessGetProposalDetailCopyWithImpl<$Res>
    implements $SuccessGetProposalDetailCopyWith<$Res> {
  _$SuccessGetProposalDetailCopyWithImpl(this._self, this._then);

  final SuccessGetProposalDetail _self;
  final $Res Function(SuccessGetProposalDetail) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,Object? proposals = null,}) {
  return _then(SuccessGetProposalDetail(
proposal: null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,proposals: null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<PurchaseProposalModel>,
  ));
}


}

/// @nodoc


class SuccessGetProposalStatus implements ProposalsState {
  const SuccessGetProposalStatus({required this.status, required final  List<PurchaseProposalModel> proposals}): _proposals = proposals;
  

 final  ProposalStatusResponse status;
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
$SuccessGetProposalStatusCopyWith<SuccessGetProposalStatus> get copyWith => _$SuccessGetProposalStatusCopyWithImpl<SuccessGetProposalStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetProposalStatus&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.successGetProposalStatus(status: $status, proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $SuccessGetProposalStatusCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $SuccessGetProposalStatusCopyWith(SuccessGetProposalStatus value, $Res Function(SuccessGetProposalStatus) _then) = _$SuccessGetProposalStatusCopyWithImpl;
@useResult
$Res call({
 ProposalStatusResponse status, List<PurchaseProposalModel> proposals
});




}
/// @nodoc
class _$SuccessGetProposalStatusCopyWithImpl<$Res>
    implements $SuccessGetProposalStatusCopyWith<$Res> {
  _$SuccessGetProposalStatusCopyWithImpl(this._self, this._then);

  final SuccessGetProposalStatus _self;
  final $Res Function(SuccessGetProposalStatus) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,Object? proposals = null,}) {
  return _then(SuccessGetProposalStatus(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProposalStatusResponse,proposals: null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<PurchaseProposalModel>,
  ));
}


}

/// @nodoc


class SuccessApproveProposal implements ProposalsState {
  const SuccessApproveProposal({required this.proposal, required final  List<PurchaseProposalModel> proposals}): _proposals = proposals;
  

 final  PurchaseProposalModel proposal;
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
$SuccessApproveProposalCopyWith<SuccessApproveProposal> get copyWith => _$SuccessApproveProposalCopyWithImpl<SuccessApproveProposal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessApproveProposal&&(identical(other.proposal, proposal) || other.proposal == proposal)&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,proposal,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.successApproveProposal(proposal: $proposal, proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $SuccessApproveProposalCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $SuccessApproveProposalCopyWith(SuccessApproveProposal value, $Res Function(SuccessApproveProposal) _then) = _$SuccessApproveProposalCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal, List<PurchaseProposalModel> proposals
});




}
/// @nodoc
class _$SuccessApproveProposalCopyWithImpl<$Res>
    implements $SuccessApproveProposalCopyWith<$Res> {
  _$SuccessApproveProposalCopyWithImpl(this._self, this._then);

  final SuccessApproveProposal _self;
  final $Res Function(SuccessApproveProposal) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,Object? proposals = null,}) {
  return _then(SuccessApproveProposal(
proposal: null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,proposals: null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<PurchaseProposalModel>,
  ));
}


}

/// @nodoc


class SuccessRejectProposal implements ProposalsState {
  const SuccessRejectProposal({required this.proposal, required final  List<PurchaseProposalModel> proposals}): _proposals = proposals;
  

 final  PurchaseProposalModel proposal;
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
$SuccessRejectProposalCopyWith<SuccessRejectProposal> get copyWith => _$SuccessRejectProposalCopyWithImpl<SuccessRejectProposal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessRejectProposal&&(identical(other.proposal, proposal) || other.proposal == proposal)&&const DeepCollectionEquality().equals(other._proposals, _proposals));
}


@override
int get hashCode => Object.hash(runtimeType,proposal,const DeepCollectionEquality().hash(_proposals));

@override
String toString() {
  return 'ProposalsState.successRejectProposal(proposal: $proposal, proposals: $proposals)';
}


}

/// @nodoc
abstract mixin class $SuccessRejectProposalCopyWith<$Res> implements $ProposalsStateCopyWith<$Res> {
  factory $SuccessRejectProposalCopyWith(SuccessRejectProposal value, $Res Function(SuccessRejectProposal) _then) = _$SuccessRejectProposalCopyWithImpl;
@useResult
$Res call({
 PurchaseProposalModel proposal, List<PurchaseProposalModel> proposals
});




}
/// @nodoc
class _$SuccessRejectProposalCopyWithImpl<$Res>
    implements $SuccessRejectProposalCopyWith<$Res> {
  _$SuccessRejectProposalCopyWithImpl(this._self, this._then);

  final SuccessRejectProposal _self;
  final $Res Function(SuccessRejectProposal) _then;

/// Create a copy of ProposalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? proposal = null,Object? proposals = null,}) {
  return _then(SuccessRejectProposal(
proposal: null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as PurchaseProposalModel,proposals: null == proposals ? _self._proposals : proposals // ignore: cast_nullable_to_non_nullable
as List<PurchaseProposalModel>,
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
