class CompareModel {
  final String productName;
  final double bestPrice;
  final String supplier;

  const CompareModel({
    required this.productName,
    required this.bestPrice,
    required this.supplier,
  });

  factory CompareModel.fromJson(Map<String, dynamic> json) {
    final bestPriceRaw = json['best_price'];
    return CompareModel(
      productName: json['product_name']?.toString() ?? '',
      bestPrice: bestPriceRaw is num
          ? bestPriceRaw.toDouble()
          : double.tryParse(bestPriceRaw?.toString() ?? '') ?? 0,
      supplier: json['supplier']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'product_name': productName,
    'best_price': bestPrice,
    'supplier': supplier,
  };
}
