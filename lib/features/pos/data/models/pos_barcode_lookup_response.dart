class PosBarcodeLookupResponse {
  final int? inventoryId;
  final String? productName;
  final String? unitPrice;
  final String? discountPercentage;
  final int? quantityOnHand;
  final String? barcode;

  const PosBarcodeLookupResponse({
    this.inventoryId,
    this.productName,
    this.unitPrice,
    this.discountPercentage,
    this.quantityOnHand,
    this.barcode,
  });

  factory PosBarcodeLookupResponse.fromJson(Map<String, dynamic> json) {
    return PosBarcodeLookupResponse(
      inventoryId: _parseInt(
        json['inventory_id'] ??
            json['inventoryItem'] ??
            json['inventory_item'] ??
            json['id'],
      ),
      productName: _parseString(
        json['product_name'] ?? json['product'] ?? json['name'],
      ),
      unitPrice: _parseString(
        json['unit_price'] ?? json['price'] ?? json['selling_price'],
      ),
      discountPercentage: _parseString(
        json['discount_percentage'] ?? json['discount'],
      ),
      quantityOnHand: _parseInt(
        json['quantity_on_hand'] ?? json['quantity'] ?? json['stock'],
      ),
      barcode: _parseString(json['barcode']),
    );
  }

  bool get hasAnyData {
    return inventoryId != null ||
        (productName != null && productName!.isNotEmpty) ||
        (unitPrice != null && unitPrice!.isNotEmpty) ||
        (barcode != null && barcode!.isNotEmpty);
  }

  static int? _parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value);
    return null;
  }

  static String? _parseString(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    return value.toString();
  }
}
