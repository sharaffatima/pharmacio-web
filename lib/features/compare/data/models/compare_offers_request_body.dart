import 'package:json_annotation/json_annotation.dart';

part 'compare_offers_request_body.g.dart';

@JsonSerializable()
class CompareOffersRequestBody {
  @JsonKey(name: 'ocr_result_ids')
  final List<int>? ocrResultIds;

  CompareOffersRequestBody({this.ocrResultIds});

  factory CompareOffersRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CompareOffersRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CompareOffersRequestBodyToJson(this);
}
