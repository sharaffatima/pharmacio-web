/// Maps to backend InventoryListSerializer which returns:
///   { "product": str, "quantity": int, "status": "low"|"ok" }
///
/// NOTE: The backend GET /inventory/ does NOT return `id`, `strength`,
/// `min_threshold`, or `updated_at`. The `id` is only available from
/// the adjust endpoint response. We store it as nullable here and
/// populate it from context (e.g. adjust response) when needed.
class InventoryItemResponse {
  final int? id; // nullable — not returned by list endpoint
  final String product;
  final String strength; // not returned by list; kept for display fallback
  final int quantity;
  final int minThreshold; // not returned by list; kept for display fallback
  final String status; // "low" | "ok"
  final String updatedAt; // not returned by list

  const InventoryItemResponse({
    this.id,
    required this.product,
    this.strength = '',
    required this.quantity,
    this.minThreshold = 0,
    required this.status,
    this.updatedAt = '',
  });

  bool get isLowStock => status == 'low';

  factory InventoryItemResponse.fromJson(Map<String, dynamic> json) {
    return InventoryItemResponse(
      id: json['id'] as int?,
      product: json['product'] as String? ?? '',
      strength: json['strength'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      minThreshold: json['min_threshold'] as int? ?? 0,
      status: json['status'] as String? ?? 'ok',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'product': product,
        'strength': strength,
        'quantity': quantity,
        'min_threshold': minThreshold,
        'status': status,
        'updated_at': updatedAt,
      };
}
