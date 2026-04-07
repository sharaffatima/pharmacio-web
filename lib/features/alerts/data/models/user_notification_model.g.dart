// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserNotificationModel _$UserNotificationModelFromJson(
  Map<String, dynamic> json,
) => UserNotificationModel(
  id: (json['id'] as num).toInt(),
  notificationId: (json['notification_id'] as num).toInt(),
  type: json['type'] as String,
  message: json['message'] as String,
  isRead: json['is_read'] as bool,
  readAt: json['read_at'] == null
      ? null
      : DateTime.parse(json['read_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserNotificationModelToJson(
  UserNotificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'notification_id': instance.notificationId,
  'type': instance.type,
  'message': instance.message,
  'is_read': instance.isRead,
  'read_at': instance.readAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
};
