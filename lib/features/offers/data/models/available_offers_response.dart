import 'package:json_annotation/json_annotation.dart';

import 'available_offer_item.dart';

part 'available_offers_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AvailableOffersResponse {
  final int? count;
  final String? next;
  final String? previous;
  final List<AvailableOfferItem>? results;

  AvailableOffersResponse({this.count, this.next, this.previous, this.results});

  factory AvailableOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableOffersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOffersResponseToJson(this);
}
