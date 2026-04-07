// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compare_generated_proposal_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompareGeneratedProposalItemModel _$CompareGeneratedProposalItemModelFromJson(
  Map<String, dynamic> json,
) => CompareGeneratedProposalItemModel(
  id: (json['id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  strength: json['strength'] as String?,
  company: json['company'] as String?,
  wareHouseName: json['ware_house_name'] as String?,
  proposedQuantity: (json['proposed_quantity'] as num?)?.toInt(),
  unitPrice: json['unit_price'] as String?,
  lineTotal: json['line_total'] as String?,
);

Map<String, dynamic> _$CompareGeneratedProposalItemModelToJson(
  CompareGeneratedProposalItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'product_name': instance.productName,
  'strength': instance.strength,
  'company': instance.company,
  'ware_house_name': instance.wareHouseName,
  'proposed_quantity': instance.proposedQuantity,
  'unit_price': instance.unitPrice,
  'line_total': instance.lineTotal,
};
