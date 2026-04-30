// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    UploadResponse(
      uploadId: json['upload_id'] as String?,
      originalFilename: json['original_filename'] as String?,
      fileUrl: json['file_url'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) =>
    <String, dynamic>{
      'upload_id': instance.uploadId,
      'original_filename': instance.originalFilename,
      'file_url': instance.fileUrl,
      'status': instance.status,
      'message': instance.message,
      'created_at': instance.createdAt,
    };
