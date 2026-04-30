import 'package:json_annotation/json_annotation.dart';

import 'compare_available_offer_item.dart';

part 'compare_available_offers_response.g.dart';

@JsonSerializable(explicitToJson: true)
class CompareAvailableOffersResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<CompareAvailableOfferItem>? results;

  CompareAvailableOffersResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory CompareAvailableOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$CompareAvailableOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompareAvailableOffersResponseToJson(this);
}
