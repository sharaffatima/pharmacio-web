import 'package:json_annotation/json_annotation.dart';

part 'available_offer_item.g.dart';

@JsonSerializable()
class AvailableOfferItem {
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

  AvailableOfferItem({
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

  factory AvailableOfferItem.fromJson(Map<String, dynamic> json) =>
      _$AvailableOfferItemFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableOfferItemToJson(this);
}
