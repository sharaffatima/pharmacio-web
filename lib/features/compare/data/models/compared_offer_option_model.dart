import 'package:json_annotation/json_annotation.dart';

part 'compared_offer_option_model.g.dart';

@JsonSerializable()
class ComparedOfferOptionModel {
  @JsonKey(name: 'offer_id')
  final int? offerId;

  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;

  final String? price;

  @JsonKey(name: 'item_id')
  final int? itemId;

  ComparedOfferOptionModel({
    this.offerId,
    this.wareHouseName,
    this.price,
    this.itemId,
  });

  factory ComparedOfferOptionModel.fromJson(Map<String, dynamic> json) =>
      _$ComparedOfferOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ComparedOfferOptionModelToJson(this);
}
