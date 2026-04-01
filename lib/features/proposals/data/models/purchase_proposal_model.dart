import 'purchase_proposal_item_model.dart';

class PurchaseProposalModel {
  final int id;
  final String status; // pending | approved | rejected
  final String totalCost;
  final String createdBy;
  final String? approvedBy;
  final String createdAt;
  final String updatedAt;
  final List<PurchaseProposalItemModel> items;

  const PurchaseProposalModel({
    required this.id,
    required this.status,
    required this.totalCost,
    required this.createdBy,
    this.approvedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory PurchaseProposalModel.fromJson(Map<String, dynamic> json) {
    final rawItems = json['items'] as List<dynamic>? ?? [];
    return PurchaseProposalModel(
      id: json['id'] as int? ?? 0,
      status: json['status'] as String? ?? 'pending',
      totalCost: json['total_cost']?.toString() ?? '0',
      createdBy: json['created_by']?.toString() ?? '',
      approvedBy: json['approved_by']?.toString(),
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      items: rawItems
          .map((e) =>
              PurchaseProposalItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
