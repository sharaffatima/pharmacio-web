import 'package:json_annotation/json_annotation.dart';

part 'inventory_sale_request_body.g.dart';

@JsonSerializable()
class InventorySaleRequestBody {
  @JsonKey(name: 'inventory_id')
  final int inventoryId;

  @JsonKey(name: 'quantity_sold')
  final int quantitySold;

  @JsonKey(name: 'unit_price')
  final String unitPrice;

  @JsonKey(name: 'sold_at')
  final DateTime soldAt;

  InventorySaleRequestBody({
    required this.inventoryId,
    required this.quantitySold,
    required this.unitPrice,
    required this.soldAt,
  });

  factory InventorySaleRequestBody.fromJson(Map<String, dynamic> json) =>
      _$InventorySaleRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$InventorySaleRequestBodyToJson(this);
}
