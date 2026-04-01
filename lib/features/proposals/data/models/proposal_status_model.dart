class ProposalStatusModel {
  final int id;
  final String status;
  final String totalCost;
  final String createdBy;
  final String? approvedBy;
  final String createdAt;
  final String updatedAt;

  const ProposalStatusModel({
    required this.id,
    required this.status,
    required this.totalCost,
    required this.createdBy,
    this.approvedBy,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProposalStatusModel.fromJson(Map<String, dynamic> json) {
    return ProposalStatusModel(
      id: json['id'] as int? ?? 0,
      status: json['status'] as String? ?? 'pending',
      totalCost: json['total_cost']?.toString() ?? '0',
      createdBy: json['created_by']?.toString() ?? '',
      approvedBy: json['approved_by']?.toString(),
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );
  }
}
