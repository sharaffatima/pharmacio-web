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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompareInitial value)?  initial,TResult Function( CompareLoading value)?  loading,TResult Function( SuccessGetAvailableOffers value)?  successGetAvailableOffers,TResult Function( SuccessCompareOffers value)?  successCompareOffers,TResult Function( SuccessGenerateProposal value)?  successGenerateProposal,TResult Function( CompareError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial(_that);case CompareLoading() when loading != null:
return loading(_that);case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that);case SuccessCompareOffers() when successCompareOffers != null:
return successCompareOffers(_that);case SuccessGenerateProposal() when successGenerateProposal != null:
return successGenerateProposal(_that);case CompareError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompareInitial value)  initial,required TResult Function( CompareLoading value)  loading,required TResult Function( SuccessGetAvailableOffers value)  successGetAvailableOffers,required TResult Function( SuccessCompareOffers value)  successCompareOffers,required TResult Function( SuccessGenerateProposal value)  successGenerateProposal,required TResult Function( CompareError value)  error,}){
final _that = this;
switch (_that) {
case CompareInitial():
return initial(_that);case CompareLoading():
return loading(_that);case SuccessGetAvailableOffers():
return successGetAvailableOffers(_that);case SuccessCompareOffers():
return successCompareOffers(_that);case SuccessGenerateProposal():
return successGenerateProposal(_that);case CompareError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompareInitial value)?  initial,TResult? Function( CompareLoading value)?  loading,TResult? Function( SuccessGetAvailableOffers value)?  successGetAvailableOffers,TResult? Function( SuccessCompareOffers value)?  successCompareOffers,TResult? Function( SuccessGenerateProposal value)?  successGenerateProposal,TResult? Function( CompareError value)?  error,}){
final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial(_that);case CompareLoading() when loading != null:
return loading(_that);case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that);case SuccessCompareOffers() when successCompareOffers != null:
return successCompareOffers(_that);case SuccessGenerateProposal() when successGenerateProposal != null:
return successGenerateProposal(_that);case CompareError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)?  successGetAvailableOffers,TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)?  successCompareOffers,TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse proposal)?  successGenerateProposal,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial();case CompareLoading() when loading != null:
return loading();case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessCompareOffers() when successCompareOffers != null:
return successCompareOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessGenerateProposal() when successGenerateProposal != null:
return successGenerateProposal(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.proposal);case CompareError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)  successGetAvailableOffers,required TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)  successCompareOffers,required TResult Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse proposal)  successGenerateProposal,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case CompareInitial():
return initial();case CompareLoading():
return loading();case SuccessGetAvailableOffers():
return successGetAvailableOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessCompareOffers():
return successCompareOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessGenerateProposal():
return successGenerateProposal(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.proposal);case CompareError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)?  successGetAvailableOffers,TResult? Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse? generatedProposal)?  successCompareOffers,TResult? Function( List<CompareAvailableOfferItem> offers,  List<int> selectedOfferIds,  List<CompareOfferResultModel> comparedResults,  CompareGeneratedProposalResponse proposal)?  successGenerateProposal,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case CompareInitial() when initial != null:
return initial();case CompareLoading() when loading != null:
return loading();case SuccessGetAvailableOffers() when successGetAvailableOffers != null:
return successGetAvailableOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessCompareOffers() when successCompareOffers != null:
return successCompareOffers(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.generatedProposal);case SuccessGenerateProposal() when successGenerateProposal != null:
return successGenerateProposal(_that.offers,_that.selectedOfferIds,_that.comparedResults,_that.proposal);case CompareError() when error != null:
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


class SuccessGetAvailableOffers implements CompareState {
  const SuccessGetAvailableOffers({required final  List<CompareAvailableOfferItem> offers, required final  List<int> selectedOfferIds, required final  List<CompareOfferResultModel> comparedResults, this.generatedProposal}): _offers = offers,_selectedOfferIds = selectedOfferIds,_comparedResults = comparedResults;
  

 final  List<CompareAvailableOfferItem> _offers;
 List<CompareAvailableOfferItem> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  List<int> _selectedOfferIds;
 List<int> get selectedOfferIds {
  if (_selectedOfferIds is EqualUnmodifiableListView) return _selectedOfferIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOfferIds);
}

 final  List<CompareOfferResultModel> _comparedResults;
 List<CompareOfferResultModel> get comparedResults {
  if (_comparedResults is EqualUnmodifiableListView) return _comparedResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comparedResults);
}

 final  CompareGeneratedProposalResponse? generatedProposal;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGetAvailableOffersCopyWith<SuccessGetAvailableOffers> get copyWith => _$SuccessGetAvailableOffersCopyWithImpl<SuccessGetAvailableOffers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGetAvailableOffers&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._selectedOfferIds, _selectedOfferIds)&&const DeepCollectionEquality().equals(other._comparedResults, _comparedResults)&&(identical(other.generatedProposal, generatedProposal) || other.generatedProposal == generatedProposal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_selectedOfferIds),const DeepCollectionEquality().hash(_comparedResults),generatedProposal);

@override
String toString() {
  return 'CompareState.successGetAvailableOffers(offers: $offers, selectedOfferIds: $selectedOfferIds, comparedResults: $comparedResults, generatedProposal: $generatedProposal)';
}


}

/// @nodoc
abstract mixin class $SuccessGetAvailableOffersCopyWith<$Res> implements $CompareStateCopyWith<$Res> {
  factory $SuccessGetAvailableOffersCopyWith(SuccessGetAvailableOffers value, $Res Function(SuccessGetAvailableOffers) _then) = _$SuccessGetAvailableOffersCopyWithImpl;
@useResult
$Res call({
 List<CompareAvailableOfferItem> offers, List<int> selectedOfferIds, List<CompareOfferResultModel> comparedResults, CompareGeneratedProposalResponse? generatedProposal
});




}
/// @nodoc
class _$SuccessGetAvailableOffersCopyWithImpl<$Res>
    implements $SuccessGetAvailableOffersCopyWith<$Res> {
  _$SuccessGetAvailableOffersCopyWithImpl(this._self, this._then);

  final SuccessGetAvailableOffers _self;
  final $Res Function(SuccessGetAvailableOffers) _then;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? selectedOfferIds = null,Object? comparedResults = null,Object? generatedProposal = freezed,}) {
  return _then(SuccessGetAvailableOffers(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<CompareAvailableOfferItem>,selectedOfferIds: null == selectedOfferIds ? _self._selectedOfferIds : selectedOfferIds // ignore: cast_nullable_to_non_nullable
as List<int>,comparedResults: null == comparedResults ? _self._comparedResults : comparedResults // ignore: cast_nullable_to_non_nullable
as List<CompareOfferResultModel>,generatedProposal: freezed == generatedProposal ? _self.generatedProposal : generatedProposal // ignore: cast_nullable_to_non_nullable
as CompareGeneratedProposalResponse?,
  ));
}


}

/// @nodoc


class SuccessCompareOffers implements CompareState {
  const SuccessCompareOffers({required final  List<CompareAvailableOfferItem> offers, required final  List<int> selectedOfferIds, required final  List<CompareOfferResultModel> comparedResults, this.generatedProposal}): _offers = offers,_selectedOfferIds = selectedOfferIds,_comparedResults = comparedResults;
  

 final  List<CompareAvailableOfferItem> _offers;
 List<CompareAvailableOfferItem> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  List<int> _selectedOfferIds;
 List<int> get selectedOfferIds {
  if (_selectedOfferIds is EqualUnmodifiableListView) return _selectedOfferIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOfferIds);
}

 final  List<CompareOfferResultModel> _comparedResults;
 List<CompareOfferResultModel> get comparedResults {
  if (_comparedResults is EqualUnmodifiableListView) return _comparedResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comparedResults);
}

 final  CompareGeneratedProposalResponse? generatedProposal;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCompareOffersCopyWith<SuccessCompareOffers> get copyWith => _$SuccessCompareOffersCopyWithImpl<SuccessCompareOffers>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessCompareOffers&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._selectedOfferIds, _selectedOfferIds)&&const DeepCollectionEquality().equals(other._comparedResults, _comparedResults)&&(identical(other.generatedProposal, generatedProposal) || other.generatedProposal == generatedProposal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_selectedOfferIds),const DeepCollectionEquality().hash(_comparedResults),generatedProposal);

@override
String toString() {
  return 'CompareState.successCompareOffers(offers: $offers, selectedOfferIds: $selectedOfferIds, comparedResults: $comparedResults, generatedProposal: $generatedProposal)';
}


}

/// @nodoc
abstract mixin class $SuccessCompareOffersCopyWith<$Res> implements $CompareStateCopyWith<$Res> {
  factory $SuccessCompareOffersCopyWith(SuccessCompareOffers value, $Res Function(SuccessCompareOffers) _then) = _$SuccessCompareOffersCopyWithImpl;
@useResult
$Res call({
 List<CompareAvailableOfferItem> offers, List<int> selectedOfferIds, List<CompareOfferResultModel> comparedResults, CompareGeneratedProposalResponse? generatedProposal
});




}
/// @nodoc
class _$SuccessCompareOffersCopyWithImpl<$Res>
    implements $SuccessCompareOffersCopyWith<$Res> {
  _$SuccessCompareOffersCopyWithImpl(this._self, this._then);

  final SuccessCompareOffers _self;
  final $Res Function(SuccessCompareOffers) _then;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? selectedOfferIds = null,Object? comparedResults = null,Object? generatedProposal = freezed,}) {
  return _then(SuccessCompareOffers(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<CompareAvailableOfferItem>,selectedOfferIds: null == selectedOfferIds ? _self._selectedOfferIds : selectedOfferIds // ignore: cast_nullable_to_non_nullable
as List<int>,comparedResults: null == comparedResults ? _self._comparedResults : comparedResults // ignore: cast_nullable_to_non_nullable
as List<CompareOfferResultModel>,generatedProposal: freezed == generatedProposal ? _self.generatedProposal : generatedProposal // ignore: cast_nullable_to_non_nullable
as CompareGeneratedProposalResponse?,
  ));
}


}

/// @nodoc


class SuccessGenerateProposal implements CompareState {
  const SuccessGenerateProposal({required final  List<CompareAvailableOfferItem> offers, required final  List<int> selectedOfferIds, required final  List<CompareOfferResultModel> comparedResults, required this.proposal}): _offers = offers,_selectedOfferIds = selectedOfferIds,_comparedResults = comparedResults;
  

 final  List<CompareAvailableOfferItem> _offers;
 List<CompareAvailableOfferItem> get offers {
  if (_offers is EqualUnmodifiableListView) return _offers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offers);
}

 final  List<int> _selectedOfferIds;
 List<int> get selectedOfferIds {
  if (_selectedOfferIds is EqualUnmodifiableListView) return _selectedOfferIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedOfferIds);
}

 final  List<CompareOfferResultModel> _comparedResults;
 List<CompareOfferResultModel> get comparedResults {
  if (_comparedResults is EqualUnmodifiableListView) return _comparedResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comparedResults);
}

 final  CompareGeneratedProposalResponse proposal;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessGenerateProposalCopyWith<SuccessGenerateProposal> get copyWith => _$SuccessGenerateProposalCopyWithImpl<SuccessGenerateProposal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuccessGenerateProposal&&const DeepCollectionEquality().equals(other._offers, _offers)&&const DeepCollectionEquality().equals(other._selectedOfferIds, _selectedOfferIds)&&const DeepCollectionEquality().equals(other._comparedResults, _comparedResults)&&(identical(other.proposal, proposal) || other.proposal == proposal));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_offers),const DeepCollectionEquality().hash(_selectedOfferIds),const DeepCollectionEquality().hash(_comparedResults),proposal);

@override
String toString() {
  return 'CompareState.successGenerateProposal(offers: $offers, selectedOfferIds: $selectedOfferIds, comparedResults: $comparedResults, proposal: $proposal)';
}


}

/// @nodoc
abstract mixin class $SuccessGenerateProposalCopyWith<$Res> implements $CompareStateCopyWith<$Res> {
  factory $SuccessGenerateProposalCopyWith(SuccessGenerateProposal value, $Res Function(SuccessGenerateProposal) _then) = _$SuccessGenerateProposalCopyWithImpl;
@useResult
$Res call({
 List<CompareAvailableOfferItem> offers, List<int> selectedOfferIds, List<CompareOfferResultModel> comparedResults, CompareGeneratedProposalResponse proposal
});




}
/// @nodoc
class _$SuccessGenerateProposalCopyWithImpl<$Res>
    implements $SuccessGenerateProposalCopyWith<$Res> {
  _$SuccessGenerateProposalCopyWithImpl(this._self, this._then);

  final SuccessGenerateProposal _self;
  final $Res Function(SuccessGenerateProposal) _then;

/// Create a copy of CompareState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? offers = null,Object? selectedOfferIds = null,Object? comparedResults = null,Object? proposal = null,}) {
  return _then(SuccessGenerateProposal(
offers: null == offers ? _self._offers : offers // ignore: cast_nullable_to_non_nullable
as List<CompareAvailableOfferItem>,selectedOfferIds: null == selectedOfferIds ? _self._selectedOfferIds : selectedOfferIds // ignore: cast_nullable_to_non_nullable
as List<int>,comparedResults: null == comparedResults ? _self._comparedResults : comparedResults // ignore: cast_nullable_to_non_nullable
as List<CompareOfferResultModel>,proposal: null == proposal ? _self.proposal : proposal // ignore: cast_nullable_to_non_nullable
as CompareGeneratedProposalResponse,
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
