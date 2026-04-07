import 'package:json_annotation/json_annotation.dart';

part 'compare_generated_proposal_item_model.g.dart';

@JsonSerializable()
class CompareGeneratedProposalItemModel {
  final int? id;

  @JsonKey(name: 'product_name')
  final String? productName;

  final String? strength;
  final String? company;

  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;

  @JsonKey(name: 'proposed_quantity')
  final int? proposedQuantity;

  @JsonKey(name: 'unit_price')
  final String? unitPrice;

  @JsonKey(name: 'line_total')
  final String? lineTotal;

  CompareGeneratedProposalItemModel({
    this.id,
    this.productName,
    this.strength,
    this.company,
    this.wareHouseName,
    this.proposedQuantity,
    this.unitPrice,
    this.lineTotal,
  });

  factory CompareGeneratedProposalItemModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CompareGeneratedProposalItemModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CompareGeneratedProposalItemModelToJson(this);
}
