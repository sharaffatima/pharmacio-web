// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_offers_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareOffersRequestBody _$CompareOffersRequestBodyFromJson(
  Map<String, dynamic> json,
) => CompareOffersRequestBody(
  ocrResultIds: (json['ocr_result_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$CompareOffersRequestBodyToJson(
  CompareOffersRequestBody instance,
) => <String, dynamic>{'ocr_result_ids': instance.ocrResultIds};
