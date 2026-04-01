class SaleCreateRequestBody {
  final int inventoryId;
  final int quantitySold;
  final double unitPrice;
  final String? soldAt; // ISO 8601 — optional, backend defaults to now()

  const SaleCreateRequestBody({
    required this.inventoryId,
    required this.quantitySold,
    required this.unitPrice,
    this.soldAt,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'inventory_id': inventoryId,
      'quantity_sold': quantitySold,
      'unit_price': unitPrice,
    };
    if (soldAt != null) map['sold_at'] = soldAt;
    return map;
  }
}
