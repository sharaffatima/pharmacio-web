import 'package:json_annotation/json_annotation.dart';

import 'compare_generated_proposal_item_model.dart';

part 'compare_generated_proposal_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CompareGeneratedProposalResponse {
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

  final List<CompareGeneratedProposalItemModel>? items;

  CompareGeneratedProposalResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory CompareGeneratedProposalResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CompareGeneratedProposalResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompareGeneratedProposalResponseToJson(this);
}
