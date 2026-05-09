import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_item.g.dart';

@JsonSerializable()
class PosItem {
  final int? id;
  @JsonKey(name: 'inventory_item')
  final int? inventoryItem;
  @JsonKey(name: 'product_name')
  final String? productName;
  final String? strength;
  final int? quantity;
  @JsonKey(name: 'unit_price')
  final String? unitPrice;
  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;
  @JsonKey(name: 'total_price')
  final String? totalPrice;

  PosItem({
    this.id,
    this.inventoryItem,
    this.productName,
    this.strength,
    this.quantity,
    this.unitPrice,
    this.discountPercentage,
    this.totalPrice,
  });

  factory PosItem.fromJson(Map<String, dynamic> json) => _$PosItemFromJson(json);
  Map<String, dynamic> toJson() => _$PosItemToJson(this);
}
