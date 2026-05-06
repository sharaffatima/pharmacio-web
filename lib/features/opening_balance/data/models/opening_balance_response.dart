import 'package:json_annotation/json_annotation.dart';

part 'opening_balance_response.g.dart';

@JsonSerializable()
class OpeningBalanceResponse {
  final String message;
  final int importedItems;
  final int failedItems;
  final List<String> errors;

  OpeningBalanceResponse({
    required this.message,
    required this.importedItems,
    required this.failedItems,
    required this.errors,
  });

  factory OpeningBalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$OpeningBalanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OpeningBalanceResponseToJson(this);
}