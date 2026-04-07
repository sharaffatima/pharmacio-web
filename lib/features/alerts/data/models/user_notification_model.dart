import 'package:json_annotation/json_annotation.dart';

part 'user_notification_model.g.dart';

@JsonSerializable()
class UserNotificationModel {
  final int? id;

  @JsonKey(name: 'notification_id')
  final int? notificationId;

  final String? type;
  final String? message;

  @JsonKey(name: 'is_read')
  final bool? isRead;

  @JsonKey(name: 'read_at')
  final DateTime? readAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  UserNotificationModel({
    this.id,
    this.notificationId,
    this.type,
    this.message,
    this.isRead,
    this.readAt,
    this.createdAt,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$UserNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserNotificationModelToJson(this);
}
