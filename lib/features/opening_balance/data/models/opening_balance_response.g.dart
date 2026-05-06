// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opening_balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpeningBalanceResponse _$OpeningBalanceResponseFromJson(
  Map<String, dynamic> json,
) => OpeningBalanceResponse(
  message: json['message'] as String,
  importedItems: (json['importedItems'] as num).toInt(),
  failedItems: (json['failedItems'] as num).toInt(),
  errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$OpeningBalanceResponseToJson(
  OpeningBalanceResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'importedItems': instance.importedItems,
  'failedItems': instance.failedItems,
  'errors': instance.errors,
};
