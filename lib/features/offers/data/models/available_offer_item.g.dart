// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_offer_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableOfferItem _$AvailableOfferItemFromJson(Map<String, dynamic> json) =>
    AvailableOfferItem(
      id: (json['id'] as num?)?.toInt(),
      fileId: json['file_id'] as String?,
      originalFilename: json['original_filename'] as String?,
      wareHouseName: json['ware_house_name'] as String?,
      status: json['status'] as String?,
      confidenceScore: (json['confidence_score'] as num?)?.toDouble(),
      reviewRequired: json['review_required'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      itemsCount: (json['items_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AvailableOfferItemToJson(AvailableOfferItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_id': instance.fileId,
      'original_filename': instance.originalFilename,
      'ware_house_name': instance.wareHouseName,
      'status': instance.status,
      'confidence_score': instance.confidenceScore,
      'review_required': instance.reviewRequired,
      'created_at': instance.createdAt?.toIso8601String(),
      'items_count': instance.itemsCount,
    };
