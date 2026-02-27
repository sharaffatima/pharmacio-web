class AppStrings {
  static String currentLanguage = 'en';

  // ─── Auth ──────────────────────────────────────────────
  static String get adminLogin =>
      currentLanguage == 'ar' ? 'تسجيل دخول المشرف' : 'Admin Login';

  static String get signInSubtitle => currentLanguage == 'ar'
      ? 'سجل الدخول للوصول إلى لوحة التحكم'
      : 'Sign in to access the admin panel';

  static String get emailUsername => currentLanguage == 'ar'
      ? 'البريد الإلكتروني / اسم المستخدم'
      : 'Email / Username';

  static String get emailHint => 'admin@example.com';

  static String get password =>
      currentLanguage == 'ar' ? 'كلمة المرور' : 'Password';

  static String get passwordHint =>
      currentLanguage == 'ar' ? 'أدخل كلمة المرور' : 'Enter your password';

  static String get signIn =>
      currentLanguage == 'ar' ? 'تسجيل الدخول' : 'Sign In';

  // ─── Sidebar ─────────────────────────────────────────
  static String get adminPanel =>
      currentLanguage == 'ar' ? 'لوحة الإدارة' : 'Admin Panel';

  static String get dashboard =>
      currentLanguage == 'ar' ? 'لوحة التحكم' : 'Dashboard';

  static String get uploads =>
      currentLanguage == 'ar' ? 'التحميلات' : 'Uploads';

  static String get offers => currentLanguage == 'ar' ? 'العروض' : 'Offers';

  static String get compare => currentLanguage == 'ar' ? 'المقارنة' : 'Compare';

  static String get proposals =>
      currentLanguage == 'ar' ? 'المقترحات' : 'Proposals';

  static String get inventory =>
      currentLanguage == 'ar' ? 'المخزون' : 'Inventory';

  static String get alertsAndLogs =>
      currentLanguage == 'ar' ? 'التنبيهات والسجلات' : 'Alerts & Logs';

  static String get permissions =>
      currentLanguage == 'ar' ? 'الصلاحيات' : 'Permissions';

  static String get logout =>
      currentLanguage == 'ar' ? 'تسجيل الخروج' : 'Logout';

  // ─── Dashboard ───────────────────────────────────────
  static String get dashboardSubtitle => currentLanguage == 'ar'
      ? 'نظرة عامة وإجراءات سريعة'
      : 'Admin overview and quick actions';

  static String get activeAlerts =>
      currentLanguage == 'ar' ? 'التنبيهات النشطة' : 'Active Alerts';

  static String get lowStockCount =>
      currentLanguage == 'ar' ? 'نقص المخزون' : 'Low Stock Count';

  static String get pendingProposals =>
      currentLanguage == 'ar' ? 'المقترحات المعلقة' : 'Pending Proposals';

  static String get latestUploadsStatus =>
      currentLanguage == 'ar' ? 'حالة آخر التحميلات' : 'Latest Uploads Status';

  static String get quickActions =>
      currentLanguage == 'ar' ? 'إجراءات سريعة' : 'Quick Actions';

  static String get completed =>
      currentLanguage == 'ar' ? 'مكتمل' : 'Completed';

  static String get processing =>
      currentLanguage == 'ar' ? 'قيد المعالجة' : 'Processing';

  static String get failed => currentLanguage == 'ar' ? 'فشل' : 'Failed';

  static String get uploadNewOffers =>
      currentLanguage == 'ar' ? 'رفع عروض جديدة' : 'Upload New Offers';

  static String get compareOffers =>
      currentLanguage == 'ar' ? 'مقارنة العروض' : 'Compare Offers';

  static String get viewProposals =>
      currentLanguage == 'ar' ? 'عرض المقترحات' : 'View Proposals';

  static String get manageInventory =>
      currentLanguage == 'ar' ? 'إدارة المخزون' : 'Manage Inventory';

  // ─── Uploads ─────────────────────────────────────────
  static String get uploadsManagement =>
      currentLanguage == 'ar' ? 'إدارة التحميلات' : 'Uploads Management';

  static String get uploadsSubtitle => currentLanguage == 'ar'
      ? 'رفع العروض ومراقبة حالة المعالجة'
      : 'Upload offers and monitor processing status';

  static String get uploadNewFiles =>
      currentLanguage == 'ar' ? 'رفع ملفات جديدة' : 'Upload New Files';

  static String get dragAndDropHere => currentLanguage == 'ar'
      ? 'اسحب وأفلت الملفات هنا'
      : 'Drag and drop files here';

  static String get supportedFiles => currentLanguage == 'ar'
      ? 'يدعم ملفات PDF و Excel والصور'
      : 'Supports PDF, Excel, and Image files';

  static String get browseFiles =>
      currentLanguage == 'ar' ? 'تصفح الملفات' : 'Browse Files';

  static String get recentUploads =>
      currentLanguage == 'ar' ? 'التحميلات الأخيرة' : 'Recent Uploads';

  static String get filename =>
      currentLanguage == 'ar' ? 'اسم الملف' : 'Filename';

  static String get type => currentLanguage == 'ar' ? 'النوع' : 'Type';

  static String get createdDate =>
      currentLanguage == 'ar' ? 'تاريخ الإنشاء' : 'Created Date';

  static String get actions =>
      currentLanguage == 'ar' ? 'الإجراءات' : 'Actions';

  static String get status => currentLanguage == 'ar' ? 'الحالة' : 'Status';

  // ─── Offers ──────────────────────────────────────────
  static String get offersList =>
      currentLanguage == 'ar' ? 'قائمة العروض' : 'Offers List';

  static String get offersSubtitle => currentLanguage == 'ar'
      ? 'تصفح وإدارة العروض الموجودة'
      : 'Browse and manage existing offers';

  static String get filtersAndSearch =>
      currentLanguage == 'ar' ? 'تصفية وبحث' : 'Filters & Search';

  static String get searchOffers =>
      currentLanguage == 'ar' ? 'بحث في العروض...' : 'Search offers...';

  static String get allSuppliers =>
      currentLanguage == 'ar' ? 'جميع الموردين' : 'All Suppliers';

  static String get allWarehouses =>
      currentLanguage == 'ar' ? 'جميع المستودعات' : 'All Warehouses';

  static String get clearFilters =>
      currentLanguage == 'ar' ? 'مسح الفلاتر' : 'Clear Filters';

  static String get offerName =>
      currentLanguage == 'ar' ? 'اسم العرض' : 'Offer Name';

  static String get supplier => currentLanguage == 'ar' ? 'المورد' : 'Supplier';

  static String get warehouse =>
      currentLanguage == 'ar' ? 'المستودع' : 'Warehouse';

  static String get uploadDate =>
      currentLanguage == 'ar' ? 'تاريخ الرفع' : 'Upload Date';

  static String get items => currentLanguage == 'ar' ? 'العناصر' : 'Items';

  static String get active => currentLanguage == 'ar' ? 'نشط' : 'Active';

  // ─── Compare ─────────────────────────────────────────
  static String get compareWorkspace =>
      currentLanguage == 'ar' ? 'مساحة المقارنة' : 'Compare Workspace';

  static String get compareSubtitle => currentLanguage == 'ar'
      ? 'اختر العروض للمقارنة وإيجاد أفضل الأسعار'
      : 'Select offers to compare and find the best prices';

  static String get availableOffers =>
      currentLanguage == 'ar' ? 'العروض المتاحة' : 'Available Offers';

  static String get selectionSummary =>
      currentLanguage == 'ar' ? 'ملخص الاختيار' : 'Selection Summary';

  static String get offersSelected =>
      currentLanguage == 'ar' ? 'عروض مختارة' : 'Offers Selected';

  static String get compareOffersAction =>
      currentLanguage == 'ar' ? 'مقارنة العروض' : 'Compare Offers';

  static String get selectAtLeast2 => currentLanguage == 'ar'
      ? 'اختر عرضين على الأقل للمقارنة'
      : 'Select at least 2 offers to compare';

  static String get date => currentLanguage == 'ar' ? 'التاريخ' : 'Date';

  // ─── Proposals ───────────────────────────────────────
  static String get proposalsManagement =>
      currentLanguage == 'ar' ? 'إدارة المقترحات' : 'Proposals Management';

  static String get proposalsSubtitle => currentLanguage == 'ar'
      ? 'إدارة وتتبع دورة حياة المقترحات'
      : 'Manage and track proposal lifecycle';

  static String get totalProposals =>
      currentLanguage == 'ar' ? 'إجمالي المقترحات' : 'Total Proposals';

  static String get pending =>
      currentLanguage == 'ar' ? 'قيد الانتظار' : 'Pending';

  static String get approved =>
      currentLanguage == 'ar' ? 'موافق عليه' : 'Approved';

  static String get rejected => currentLanguage == 'ar' ? 'مرفوض' : 'Rejected';

  static String get filterProposals =>
      currentLanguage == 'ar' ? 'تصفية المقترحات' : 'Filter Proposals';

  static String get searchProposals =>
      currentLanguage == 'ar' ? 'بحث في المقترحات...' : 'Search proposals...';

  static String get allStatuses =>
      currentLanguage == 'ar' ? 'جميع الحالات' : 'All Statuses';

  static String get dateRange =>
      currentLanguage == 'ar' ? 'نطاق التاريخ' : 'Date Range';

  static String get proposalName =>
      currentLanguage == 'ar' ? 'اسم المقترح' : 'Proposal Name';

  static String get createdBy =>
      currentLanguage == 'ar' ? 'أنشئ بواسطة' : 'Created By';

  static String get totalValue =>
      currentLanguage == 'ar' ? 'القيمة الإجمالية' : 'Total Value';

  // ─── Inventory ───────────────────────────────────────
  static String get inventoryManagement =>
      currentLanguage == 'ar' ? 'إدارة المخزون' : 'Inventory Management';

  static String get inventorySubtitle => currentLanguage == 'ar'
      ? 'عرض وتعديل مستويات المخزون'
      : 'View and adjust stock levels';

  static String get totalItems =>
      currentLanguage == 'ar' ? 'إجمالي العناصر' : 'Total Items';

  static String get lowStockItems =>
      currentLanguage == 'ar' ? 'عناصر منخفضة المخزون' : 'Low Stock Items';

  static String get totalStockValue =>
      currentLanguage == 'ar' ? 'إجمالي قيمة المخزون' : 'Total Stock Value';

  static String get searchAndFilter =>
      currentLanguage == 'ar' ? 'بحث وتصفية' : 'Search & Filter';

  static String get searchByProduct => currentLanguage == 'ar'
      ? 'بحث باسم المنتج أو الرمز...'
      : 'Search by product name or code...';

  static String get lowStockOnly =>
      currentLanguage == 'ar' ? 'المنخفض فقط' : 'Low Stock Only';

  static String get inventoryItems =>
      currentLanguage == 'ar' ? 'عناصر المخزون' : 'Inventory Items';

  static String get product => currentLanguage == 'ar' ? 'المنتج' : 'Product';

  static String get code => currentLanguage == 'ar' ? 'الرمز' : 'Code';

  static String get location => currentLanguage == 'ar' ? 'الموقع' : 'Location';

  static String get currentStock =>
      currentLanguage == 'ar' ? 'المخزون الحالي' : 'Current Stock';

  static String get minMax => currentLanguage == 'ar' ? 'أدنى/أقصى' : 'Min/Max';

  static String get lastUpdated =>
      currentLanguage == 'ar' ? 'آخر تحديث' : 'Last Updated';

  static String get normal => currentLanguage == 'ar' ? 'طبيعي' : 'Normal';

  static String get lowStock => currentLanguage == 'ar' ? 'منخفض' : 'Low Stock';

  // ─── Alerts & Logs ───────────────────────────────────
  static String get alertsCenter => currentLanguage == 'ar'
      ? 'مركز التنبيهات والإشعارات'
      : 'Alerts & Notification Center';

  static String get alertsSubtitle => currentLanguage == 'ar'
      ? 'مراقبة تنبيهات النظام وسجلات المراجعة'
      : 'Monitor system alerts and audit logs';

  static String get activeAlertsCount =>
      currentLanguage == 'ar' ? 'التنبيهات النشطة' : 'Active Alerts';

  static String get criticalAlerts =>
      currentLanguage == 'ar' ? 'تنبيهات حرجة' : 'Critical Alerts';

  static String get resolvedToday =>
      currentLanguage == 'ar' ? 'تم حلها اليوم' : 'Resolved Today';

  static String get alerts => currentLanguage == 'ar' ? 'التنبيهات' : 'Alerts';

  static String get auditLogs =>
      currentLanguage == 'ar' ? 'سجلات المراجعة' : 'Audit Logs';

  static String get filterAlerts =>
      currentLanguage == 'ar' ? 'تصفية التنبيهات' : 'Filter Alerts';

  static String get allSeverities =>
      currentLanguage == 'ar' ? 'جميع المستويات' : 'All Severities';

  static String get critical => currentLanguage == 'ar' ? 'حرج' : 'Critical';

  static String get warning => currentLanguage == 'ar' ? 'تحذير' : 'Warning';

  static String get info => currentLanguage == 'ar' ? 'معلومات' : 'Info';

  static String get activeAndRecent =>
      currentLanguage == 'ar' ? 'النشطة والأخيرة' : 'Active & Recent Alerts';

  static String get resolve => currentLanguage == 'ar' ? 'حل' : 'Resolve';
}
