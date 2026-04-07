// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProposalStatusResponse _$ProposalStatusResponseFromJson(
  Map<String, dynamic> json,
) => ProposalStatusResponse(
  id: (json['id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalCost: json['total_cost'] as String?,
  createdBy: json['created_by'] as String?,
  approvedBy: json['approved_by'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProposalStatusResponseToJson(
  ProposalStatusResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
