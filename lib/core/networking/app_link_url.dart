class AppLinkUrl {
  static const String baseUrl = "http://127.0.0.1:8000/api/v1";

  static const String login = "/auth/login/";
  static const String register = "/auth/register/";
  static const String logout = "/auth/logout/";
  static const String me = "/auth/me/";
  static const String changePassword = "/auth/change-password/";

  // Uploads
  static const String upload = "/offers/upload/";
  static const String uploadStatus = "/offers/uploads/";

  // Purchase Proposals
  static const String purchaseProposals = "/purchase-proposals/";
  static const String purchaseProposalsCompare = "/purchase-proposals/compare/";
  static const String purchaseProposalsGenerate =
      "/purchase-proposals/generate/";

  // Notifications
  static const String notificationsMe = "/notifications/me/";
  static const String notificationsBase = "/notifications";
}