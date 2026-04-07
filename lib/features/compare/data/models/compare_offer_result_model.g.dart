// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_offer_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareOfferResultModel _$CompareOfferResultModelFromJson(
  Map<String, dynamic> json,
) => CompareOfferResultModel(
  drugKey: json['drug_key'] as String?,
  drugName: json['drug_name'] as String?,
  company: json['company'] as String?,
  status: json['status'] as String?,
  best: json['best'] == null
      ? null
      : ComparedOfferOptionModel.fromJson(json['best'] as Map<String, dynamic>),
  alternatives: (json['alternatives'] as List<dynamic>?)
      ?.map((e) => ComparedOfferOptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CompareOfferResultModelToJson(
  CompareOfferResultModel instance,
) => <String, dynamic>{
  'drug_key': instance.drugKey,
  'drug_name': instance.drugName,
  'company': instance.company,
  'status': instance.status,
  'best': instance.best?.toJson(),
  'alternatives': instance.alternatives?.map((e) => e.toJson()).toList(),
};
