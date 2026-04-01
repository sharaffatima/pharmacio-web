class OfferModel {
  final int id;
  final String supplier;
  final String createdAt;
  final int itemsCount;
  final String status;
  final String name;
  final String warehouse;
  final String uploadDate;

  const OfferModel({
    required this.id,
    required this.supplier,
    required this.createdAt,
    required this.itemsCount,
    required this.status,
    required this.name,
    required this.warehouse,
    required this.uploadDate,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    final createdAt = json['created_at'] as String? ?? '';
    final itemsCountDynamic = json['items_count'];

    return OfferModel(
      id: json['id'] as int? ?? 0,
      supplier: json['supplier']?.toString() ?? '',
      createdAt: createdAt,
      itemsCount: itemsCountDynamic is int
          ? itemsCountDynamic
          : int.tryParse(itemsCountDynamic?.toString() ?? '') ?? 0,
      status: json['status']?.toString() ?? '',
      name: json['name']?.toString() ?? json['supplier']?.toString() ?? '',
      warehouse: json['warehouse']?.toString() ?? '',
      uploadDate: json['upload_date']?.toString() ?? createdAt,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'supplier': supplier,
    'created_at': createdAt,
    'items_count': itemsCount,
    'status': status,
    'name': name,
    'warehouse': warehouse,
    'upload_date': uploadDate,
  };
}
