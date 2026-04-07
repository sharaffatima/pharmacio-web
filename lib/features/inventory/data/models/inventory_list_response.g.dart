// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryListResponse _$InventoryListResponseFromJson(
  Map<String, dynamic> json,
) => InventoryListResponse(
  count: (json['count'] as num).toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  results: (json['results'] as List<dynamic>)
      .map((e) => InventoryApiItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InventoryListResponseToJson(
  InventoryListResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'next': instance.next,
  'previous': instance.previous,
  'results': instance.results.map((e) => e.toJson()).toList(),
};
