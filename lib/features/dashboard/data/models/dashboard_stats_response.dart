import 'package:json_annotation/json_annotation.dart';

part 'dashboard_stats_response.g.dart';

@JsonSerializable()
class DashboardStatsResponse {
  @JsonKey(name: 'activity_alerts')
  final int? activityAlerts;

  @JsonKey(name: 'low_stock')
  final int? lowStock;

  final int? proposals;
  final int? inventory;

  DashboardStatsResponse({
    this.activityAlerts,
    this.lowStock,
    this.proposals,
    this.inventory,
  });

  factory DashboardStatsResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardStatsResponseToJson(this);
}
