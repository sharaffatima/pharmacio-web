// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_sale_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventorySaleRequestBody _$InventorySaleRequestBodyFromJson(
  Map<String, dynamic> json,
) => InventorySaleRequestBody(
  inventoryId: (json['inventory_id'] as num).toInt(),
  quantitySold: (json['quantity_sold'] as num).toInt(),
  unitPrice: json['unit_price'] as String,
  soldAt: DateTime.parse(json['sold_at'] as String),
);

Map<String, dynamic> _$InventorySaleRequestBodyToJson(
  InventorySaleRequestBody instance,
) => <String, dynamic>{
  'inventory_id': instance.inventoryId,
  'quantity_sold': instance.quantitySold,
  'unit_price': instance.unitPrice,
  'sold_at': instance.soldAt.toIso8601String(),
};