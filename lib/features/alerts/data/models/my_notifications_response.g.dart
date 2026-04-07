// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_notifications_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyNotificationsResponse _$MyNotificationsResponseFromJson(
  Map<String, dynamic> json,
) => MyNotificationsResponse(
  count: (json['count'] as num).toInt(),
  unreadCount: (json['unread_count'] as num).toInt(),
  results: (json['results'] as List<dynamic>)
      .map((e) => UserNotificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MyNotificationsResponseToJson(
  MyNotificationsResponse instance,
) => <String, dynamic>{
  'count': instance.count,
  'unread_count': instance.unreadCount,
  'results': instance.results.map((e) => e.toJson()).toList(),
};
