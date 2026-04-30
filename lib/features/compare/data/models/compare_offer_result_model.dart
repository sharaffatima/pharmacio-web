import 'package:json_annotation/json_annotation.dart';

import 'compared_offer_option_model.dart';

part 'compare_offer_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompareOfferResultModel {
  @JsonKey(name: 'drug_key')
  final String? drugKey;

  @JsonKey(name: 'drug_name')
  final String? drugName;

  final String? company;
  final String? status;
  final ComparedOfferOptionModel? best;
  final List<ComparedOfferOptionModel>? alternatives;

  CompareOfferResultModel({
    this.drugKey,
    this.drugName,
    this.company,
    this.status,
    this.best,
    this.alternatives,
  });

  factory CompareOfferResultModel.fromJson(Map<String, dynamic> json) =>
      _$CompareOfferResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompareOfferResultModelToJson(this);
}
