class InventoryCreateRequestBody {
  final String productName;
  final String strength;
  final int quantityOnHand;
  final int minThreshold;

  const InventoryCreateRequestBody({
    required this.productName,
    required this.strength,
    required this.quantityOnHand,
    required this.minThreshold,
  });

  Map<String, dynamic> toJson() => {
        'product_name': productName,
        'strength': strength,
        'quantity_on_hand': quantityOnHand,
        'min_threshold': minThreshold,
      };
}
