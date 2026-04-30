import 'package:json_annotation/json_annotation.dart';

part 'upload_response.g.dart';

@JsonSerializable()
class UploadResponse {
  @JsonKey(name: 'upload_id')
  final String? uploadId;

  @JsonKey(name: 'original_filename')
  final String? originalFilename;

  @JsonKey(name: 'file_url')
  final String? fileUrl;

  final String? status;
  final String? message;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  UploadResponse({
    this.uploadId,
    this.originalFilename,
    this.fileUrl,
    this.status,
    this.message,
    this.createdAt,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}
