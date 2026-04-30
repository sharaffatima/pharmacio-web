import 'package:json_annotation/json_annotation.dart';

part 'inventory_api_item.g.dart';

@JsonSerializable()
class InventoryApiItem {
  final int? id;
  final String? product;
  final int? quantity;
  final String? status;

  InventoryApiItem({this.id, this.product, this.quantity, this.status});

  factory InventoryApiItem.fromJson(Map<String, dynamic> json) =>
      _$InventoryApiItemFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryApiItemToJson(this);
}
