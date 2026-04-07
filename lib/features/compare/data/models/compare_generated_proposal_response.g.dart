// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_generated_proposal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareGeneratedProposalResponse _$CompareGeneratedProposalResponseFromJson(
  Map<String, dynamic> json,
) => CompareGeneratedProposalResponse(
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
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => CompareGeneratedProposalItemModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
);

Map<String, dynamic> _$CompareGeneratedProposalResponseToJson(
  CompareGeneratedProposalResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'total_cost': instance.totalCost,
  'created_by': instance.createdBy,
  'approved_by': instance.approvedBy,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'items': instance.items?.map((e) => e.toJson()).toList(),
};
