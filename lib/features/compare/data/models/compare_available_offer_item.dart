import 'package:json_annotation/json_annotation.dart';

part 'compare_available_offer_item.g.dart';

@JsonSerializable()
class CompareAvailableOfferItem {
  final int? id;

  @JsonKey(name: 'file_id')
  final String? fileId;

  @JsonKey(name: 'original_filename')
  final String? originalFilename;

  @JsonKey(name: 'ware_house_name')
  final String? wareHouseName;

  final String? status;

  @JsonKey(name: 'confidence_score')
  final double? confidenceScore;

  @JsonKey(name: 'review_required')
  final bool? reviewRequired;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  @JsonKey(name: 'items_count')
  final int? itemsCount;

  CompareAvailableOfferItem({
    this.id,
    this.fileId,
    this.originalFilename,
    this.wareHouseName,
    this.status,
    this.confidenceScore,
    this.reviewRequired,
    this.createdAt,
    this.itemsCount,
  });

  factory CompareAvailableOfferItem.fromJson(Map<String, dynamic> json) =>
      _$CompareAvailableOfferItemFromJson(json);

  Map<String, dynamic> toJson() => _$CompareAvailableOfferItemToJson(this);
}
