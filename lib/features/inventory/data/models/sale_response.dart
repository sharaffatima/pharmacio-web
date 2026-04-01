class SaleResponse {
  final int id;
  final String productName;
  final String strength;
  final int quantitySold;
  final String unitPrice;
  final String soldAt;
  final int inventoryId;
  final int remainingQuantity;

  const SaleResponse({
    required this.id,
    required this.productName,
    required this.strength,
    required this.quantitySold,
    required this.unitPrice,
    required this.soldAt,
    required this.inventoryId,
    required this.remainingQuantity,
  });

  factory SaleResponse.fromJson(Map<String, dynamic> json) {
    return SaleResponse(
      id: json['id'] as int? ?? 0,
      productName: json['product_name'] as String? ?? '',
      strength: json['strength'] as String? ?? '',
      quantitySold: json['quantity_sold'] as int? ?? 0,
      unitPrice: json['unit_price']?.toString() ?? '0',
      soldAt: json['sold_at'] as String? ?? '',
      inventoryId: json['inventory_id'] as int? ?? 0,
      remainingQuantity: json['remaining_quantity'] as int? ?? 0,
    );
  }
}
