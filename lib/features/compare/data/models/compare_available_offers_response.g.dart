// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_available_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareAvailableOffersResponse _$CompareAvailableOffersResponseFromJson(
  Map<String, dynamic> json,
) => CompareAvailableOffersResponse(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>?)
      ?.map(
        (e) => CompareAvailableOfferItem.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$CompareAvailableOffersResponseToJson(
  CompareAvailableOffersResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results?.map((e) => e.toJson()).toList(),
};
