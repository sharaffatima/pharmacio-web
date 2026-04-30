import 'package:json_annotation/json_annotation.dart';

part 'inventory_sale_response.g.dart';

@JsonSerializable()
class InventorySaleResponse {
  final int? id;

  @JsonKey(name: 'product_name')
  final String? productName;

  final String? strength;

  @JsonKey(name: 'quantity_sold')
  final int? quantitySold;

  @JsonKey(name: 'unit_price')
  final String? unitPrice;

  @JsonKey(name: 'sold_at')
  final DateTime? soldAt;

  @JsonKey(name: 'inventory_id')
  final int? inventoryId;

  @JsonKey(name: 'remaining_quantity')
  final int? remainingQuantity;

  InventorySaleResponse({
    this.id,
    this.productName,
    this.strength,
    this.quantitySold,
    this.unitPrice,
    this.soldAt,
    this.inventoryId,
    this.remainingQuantity,
  });

  factory InventorySaleResponse.fromJson(Map<String, dynamic> json) =>
      _$InventorySaleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventorySaleResponseToJson(this);
}
