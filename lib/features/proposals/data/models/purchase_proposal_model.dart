import 'package:json_annotation/json_annotation.dart';

import 'proposal_item_model.dart';

part 'purchase_proposal_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PurchaseProposalModel {
  final int? id;
  final String? status;

  @JsonKey(name: 'total_cost')
  final String? totalCost;

  @JsonKey(name: 'created_by')
  final String? createdBy;

  @JsonKey(name: 'approved_by')
  final String? approvedBy;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  final List<ProposalItemModel>? items;

  PurchaseProposalModel({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory PurchaseProposalModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseProposalModelFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseProposalModelToJson(this);
}
