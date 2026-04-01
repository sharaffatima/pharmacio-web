class AppLinkUrl {
  static const String baseUrl = "http://localhost:8000/api/v1";

  // ─── Auth ──────────────────────────────────────────────────────────────────
  static const String login = "/auth/login/";
  static const String register = "/auth/register/";
  static const String adminRegister = "/auth/admin/register/";
  static const String logout = "/auth/logout/";
  static const String me = "/auth/me/";
  static const String changePassword = "/auth/change-password/";

  // ─── Offers ────────────────────────────────────────────────────────────────
  static const String offers = "/offers/";
  static const String upload = "/offers/upload/";
  static const String uploadStatus = "/offers/uploads/";

  // ─── Inventory ─────────────────────────────────────────────────────────────
  static const String inventory = "/inventory/";
  static String inventoryAdjust(int id) => "/inventory/$id/adjust/";

  // ─── Sales ─────────────────────────────────────────────────────────────────
  static const String sales = "/sales/";

  // ─── Purchase Proposals ────────────────────────────────────────────────────
  static const String purchaseProposals = "/purchase-proposals/";
  static const String purchaseProposalsCompare = "/purchase-proposals/compare/";
  static const String purchaseProposalsGenerate =
      "/purchase-proposals/generate/";
  static String purchaseProposalDetail(int id) => "/purchase-proposals/$id/";
  static String purchaseProposalApprove(int id) =>
      "/purchase-proposals/$id/approve/";
  static String purchaseProposalReject(int id) =>
      "/purchase-proposals/$id/reject/";
  static String purchaseProposalStatus(int id) =>
      "/purchase-proposals/$id/status/";

  // ─── Notifications ─────────────────────────────────────────────────────────
  static const String notificationsMe = "/notifications/me/";
  static String notificationRead(int id) => "/notifications/$id/read/";

  // ─── RBAC / Permissions ───────────────────────────────────────────────────
  static const String permissionsCheck = "/permissions/check";
  static const String rbacPermissions = "/rbac/permissions";
  static String rbacPermissionDetail(int id) => "/rbac/permissions/$id";
  static const String rbacRoles = "/rbac/roles";
  static String rbacRoleDetail(int id) => "/rbac/roles/$id";
  static String rbacRolePermissions(int roleId) =>
      "/rbac/roles/$roleId/permissions/";
  static String rbacUserRoles(int userId) => "/rbac/users/$userId/roles/";
  static String rbacRemoveUserRole(int userId, int roleId) =>
      "/rbac/users/$userId/roles/$roleId/";
}
