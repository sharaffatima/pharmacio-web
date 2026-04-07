class AppLinkUrl {
  static const String baseUrl = "http://localhost:8000/api/v1";
  static const String login = "/auth/login/";
  static const String register = "/auth/register/";
  static const String logout = "/auth/logout/";
  static const String me = "/auth/me/";
  static const String changePassword = "/auth/change-password/";

  // Uploads
  static const String upload = "/offers/upload/";
  static const String uploadStatus = "/offers/uploads/";

  // Inventory
  static const String inventory = "/inventory/";

  // Dashboard
  static const String dashboardStats = "/notifications/dashboard/stats/";
  static const String dashboardRecentActivity =
      "/notifications/dashboard/recent-activity/";

  // Alerts
  static const String myNotifications = "/notifications/me/";
}
