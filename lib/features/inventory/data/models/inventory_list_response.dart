import 'package:json_annotation/json_annotation.dart';

import 'inventory_api_item.dart';

part 'inventory_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InventoryListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<InventoryApiItem> results;

  InventoryListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory InventoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$InventoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InventoryListResponseToJson(this);
}
