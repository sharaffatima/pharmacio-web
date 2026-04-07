import 'package:json_annotation/json_annotation.dart';

import 'purchase_proposal_model.dart';

part 'purchase_proposals_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PurchaseProposalsResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<PurchaseProposalModel>? results;

  PurchaseProposalsResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PurchaseProposalsResponse.fromJson(Map<String, dynamic> json) =>
      _$PurchaseProposalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PurchaseProposalsResponseToJson(this);
}
