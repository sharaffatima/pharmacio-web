import 'package:json_annotation/json_annotation.dart';

import 'user_notification_model.dart';

part 'my_notifications_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyNotificationsResponse {
  final int? count;

  @JsonKey(name: 'unread_count')
  final int? unreadCount;

  final List<UserNotificationModel>? results;

  MyNotificationsResponse({this.count, this.unreadCount, this.results});

  factory MyNotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$MyNotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MyNotificationsResponseToJson(this);
}
