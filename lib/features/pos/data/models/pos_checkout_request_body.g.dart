// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_checkout_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosCheckoutRequestBody _$PosCheckoutRequestBodyFromJson(
  Map<String, dynamic> json,
) => PosCheckoutRequestBody(
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => PosCheckoutItemRequestBody.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  payments: (json['payments'] as List<dynamic>?)
      ?.map((e) => PosPayment.fromJson(e as Map<String, dynamic>))
      .toList(),
  discountPercentage: json['discount_percentage'] as String?,
);

Map<String, dynamic> _$PosCheckoutRequestBodyToJson(
  PosCheckoutRequestBody instance,
) => <String, dynamic>{
  'items': instance.items,
  'payments': instance.payments,
  'discount_percentage': instance.discountPercentage,
};

PosCheckoutItemRequestBody _$PosCheckoutItemRequestBodyFromJson(
  Map<String, dynamic> json,
) => PosCheckoutItemRequestBody(
  inventoryId: (json['inventory_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  unitPrice: json['unit_price'] as String?,
  discountPercentage: json['discount_percentage'] as String?,
);

Map<String, dynamic> _$PosCheckoutItemRequestBodyToJson(
  PosCheckoutItemRequestBody instance,
) => <String, dynamic>{
  'inventory_id': instance.inventoryId,
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'discount_percentage': instance.discountPercentage,
};
