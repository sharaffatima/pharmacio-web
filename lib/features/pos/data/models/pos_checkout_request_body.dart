import 'package:json_annotation/json_annotation.dart'; // يُفضل استخدام json_annotation بدلاً من freezed إذا لم تكن تستخدم @freezed
import 'pos_payment.dart';

part 'pos_checkout_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class PosCheckoutRequestBody {
  final List<PosCheckoutItemRequestBody>? items;
  final List<PosPayment>? payments;
  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  PosCheckoutRequestBody({this.items, this.payments, this.discountPercentage});

  factory PosCheckoutRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PosCheckoutRequestBodyFromJson(json);
      
  Map<String, dynamic> toJson() => _$PosCheckoutRequestBodyToJson(this);
}

@JsonSerializable()
class PosCheckoutItemRequestBody {
  @JsonKey(name: 'inventory_id')
  final int? inventoryId;
  final int? quantity;
  @JsonKey(name: 'unit_price')
  final String? unitPrice;
  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;

  PosCheckoutItemRequestBody({
    this.inventoryId,
    this.quantity,
    this.unitPrice,
    this.discountPercentage,
  });

  factory PosCheckoutItemRequestBody.fromJson(Map<String, dynamic> json) =>
      _$PosCheckoutItemRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PosCheckoutItemRequestBodyToJson(this);
}