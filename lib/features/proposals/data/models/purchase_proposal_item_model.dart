class PurchaseProposalItemModel {
  final int id;
  final String productName;
  final String strength;
  final String company;
  final String wareHouseName;
  final int proposedQuantity;
  final String unitPrice;
  final String lineTotal;

  const PurchaseProposalItemModel({
    required this.id,
    required this.productName,
    required this.strength,
    required this.company,
    required this.wareHouseName,
    required this.proposedQuantity,
    required this.unitPrice,
    required this.lineTotal,
  });

  factory PurchaseProposalItemModel.fromJson(Map<String, dynamic> json) {
    return PurchaseProposalItemModel(
      id: json['id'] as int? ?? 0,
      productName: json['product_name'] as String? ?? '',
      strength: json['strength'] as String? ?? '',
      company: json['company'] as String? ?? '',
      wareHouseName: json['ware_house_name'] as String? ?? '',
      proposedQuantity: json['proposed_quantity'] as int? ?? 0,
      unitPrice: json['unit_price']?.toString() ?? '0',
      lineTotal: json['line_total']?.toString() ?? '0',
    );
  }
}
