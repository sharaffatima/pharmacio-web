class InventoryAdjustRequestBody {
  final int adjustment; // signed delta: positive = restock, negative = write-off
  final String reason;

  const InventoryAdjustRequestBody({
    required this.adjustment,
    this.reason = '',
  });

  Map<String, dynamic> toJson() => {
        'adjustment': adjustment,
        'reason': reason,
      };
}
