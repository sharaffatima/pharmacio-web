class UserNotificationModel {
  final int id;
  final int notificationId;
  final String type;
  final String message;
  final bool isRead;
  final String? readAt;
  final String createdAt;

  const UserNotificationModel({
    required this.id,
    required this.notificationId,
    required this.type,
    required this.message,
    required this.isRead,
    this.readAt,
    required this.createdAt,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) {
    return UserNotificationModel(
      id: json['id'] as int? ?? 0,
      notificationId: json['notification_id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      message: json['message'] as String? ?? '',
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String? ?? '',
    );
  }
}
