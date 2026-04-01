class InventoryAdjustResponse {
  final int id;
  final String product;
  final int previousQuantity;
  final int adjustment;
  final int quantity;

  const InventoryAdjustResponse({
    required this.id,
    required this.product,
    required this.previousQuantity,
    required this.adjustment,
    required this.quantity,
  });

  factory InventoryAdjustResponse.fromJson(Map<String, dynamic> json) {
    return InventoryAdjustResponse(
      id: json['id'] as int? ?? 0,
      product: json['product'] as String? ?? '',
      previousQuantity: json['previous_quantity'] as int? ?? 0,
      adjustment: json['adjustment'] as int? ?? 0,
      quantity: json['quantity'] as int? ?? 0,
    );
  }
}
