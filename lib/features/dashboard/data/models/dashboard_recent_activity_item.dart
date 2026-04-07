import 'package:json_annotation/json_annotation.dart';

part 'dashboard_recent_activity_item.g.dart';

@JsonSerializable()
class DashboardRecentActivityItem {
  final int? id;
  final String? action;
  final String? message;
  final String? theme;
  final String? icon;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  final String? actor;

  DashboardRecentActivityItem({
    this.id,
    this.action,
    this.message,
    this.theme,
    this.icon,
    this.createdAt,
    this.actor,
  });

  factory DashboardRecentActivityItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardRecentActivityItemFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardRecentActivityItemToJson(this);
}
