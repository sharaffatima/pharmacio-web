// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compared_offer_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComparedOfferOptionModel _$ComparedOfferOptionModelFromJson(
  Map<String, dynamic> json,
) => ComparedOfferOptionModel(
  offerId: (json['offer_id'] as num?)?.toInt(),
  wareHouseName: json['ware_house_name'] as String?,
  price: json['price'] as String?,
  itemId: (json['item_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ComparedOfferOptionModelToJson(
  ComparedOfferOptionModel instance,
) => <String, dynamic>{
  'offer_id': instance.offerId,
  'ware_house_name': instance.wareHouseName,
  'price': instance.price,
  'item_id': instance.itemId,
};
