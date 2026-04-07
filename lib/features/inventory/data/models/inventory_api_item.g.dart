// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_api_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventoryApiItem _$InventoryApiItemFromJson(Map<String, dynamic> json) =>
    InventoryApiItem(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$InventoryApiItemToJson(InventoryApiItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'quantity': instance.quantity,
      'status': instance.status,
    };
