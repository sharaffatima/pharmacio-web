import 'package:json_annotation/json_annotation.dart';

part 'proposal_status_response.g.dart';

@JsonSerializable()
class ProposalStatusResponse {
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

  ProposalStatusResponse({
    this.id,
    this.status,
    this.totalCost,
    this.createdBy,
    this.approvedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ProposalStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$ProposalStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProposalStatusResponseToJson(this);
}
