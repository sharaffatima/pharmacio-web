// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosItem _$PosItemFromJson(Map<String, dynamic> json) => PosItem(
  id: (json['id'] as num?)?.toInt(),
  inventoryItem: (json['inventory_item'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  strength: json['strength'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: json['unit_price'] as String?,
  discountPercentage: json['discount_percentage'] as String?,
  totalPrice: json['total_price'] as String?,
);

Map<String, dynamic> _$PosItemToJson(PosItem instance) => <String, dynamic>{
  'id': instance.id,
  'inventory_item': instance.inventoryItem,
  'product_name': instance.productName,
  'strength': instance.strength,
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'discount_percentage': instance.discountPercentage,
  'total_price': instance.totalPrice,
};
