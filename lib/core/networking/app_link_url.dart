class AppLinkUrl {
  static const String baseUrl = "https://api.35.228.22.79.nip.io/api/v1";
  static const String login = "/auth/login/";
  static const String register = "/auth/register/";
  static const String logout = "/auth/logout/";
  static const String me = "/auth/me/";
  static const String changePassword = "/auth/change-password/";

  // Uploads
  static const String upload = "/offers/upload/";
  static const String uploadStatus = "/offers/uploads/";
  static const String availableOffers = "/available-offers/";

  // Inventory
  static const String inventory = "/inventory/";
  static const String sales = "/sales/";

  // Dashboard
  static const String dashboardStats = "/notifications/dashboard/stats/";
  static const String dashboardRecentActivity =
      "/notifications/dashboard/recent-activity/";

  // Alerts
  static const String myNotifications = "/notifications/me/";

  // Proposals
  static const String purchaseProposals = "/purchase-proposals/";
  static const String compareOffers = "/purchase-proposals/compare/";
  static const String generatePurchaseProposal =
      "/purchase-proposals/generate/";
}
