// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_proposals_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchaseProposalsResponse _$PurchaseProposalsResponseFromJson(
  Map<String, dynamic> json,
) => PurchaseProposalsResponse(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>?)
      ?.map((e) => PurchaseProposalModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PurchaseProposalsResponseToJson(
  PurchaseProposalsResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results?.map((e) => e.toJson()).toList(),
};
