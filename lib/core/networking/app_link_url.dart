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
  static const String availableOffers = "/available-offers/";

  // Inventory
  static const String inventory = "/inventory/";

  // POS (replaced legacy /sales/ — see backend update 2026-05-06).
  // Checkout takes { items:[{inventory_id, quantity, unit_price}],
  //                  payments:[{payment_method, amount_paid}] }.
  static const String posCheckout = "/pos/checkout/";
  static const String posTransactions = "/pos/transactions/";
  static String posTransactionReceipt(int id) =>
      "/pos/transactions/$id/receipt/";
  static String posTransactionRefund(int id) =>
      "/pos/transactions/$id/refund/";

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

  /// PDF download for a single proposal: GET /purchase-proposals/{id}/pdf/
  static String purchaseProposalPdf(int id) => "/purchase-proposals/$id/pdf/";

  /// ZIP download bundling all proposals: GET /purchase-proposals/download-all/
  static const String purchaseProposalsZip =
      "/purchase-proposals/download-all/";

  // Opening Balance
  static const String openingBalanceImport = "/opening-balance/import/";
}
