import 'notification_model.dart';

class NotificationsResponse {
  final int count;
  final int unreadCount;
  final List<UserNotificationModel> results;

  const NotificationsResponse({
    required this.count,
    required this.unreadCount,
    required this.results,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'] as List<dynamic>? ?? [];
    return NotificationsResponse(
      count: json['count'] as int? ?? 0,
      unreadCount: json['unread_count'] as int? ?? 0,
      results: rawResults
          .map(
            (e) =>
                UserNotificationModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
