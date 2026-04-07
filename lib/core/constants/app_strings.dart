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

  static String get usernameHint => 'admin';

  static String get password =>
      currentLanguage == 'ar' ? 'كلمة المرور' : 'Password';

  static String get passwordHint =>
      currentLanguage == 'ar' ? 'أدخل كلمة المرور' : 'Enter your password';

  static String get signIn =>
      currentLanguage == 'ar' ? 'تسجيل الدخول' : 'Sign In';

  static String get registerAdminTitle =>
      currentLanguage == 'ar' ? 'تسجيل مشرف جديد' : 'Register New Admin';

  static String get registerAdminSubtitle => currentLanguage == 'ar'
      ? 'إنشاء حساب مشرف جديد للنظام'
      : 'Create a new admin account for the system';

  static String get confirmPassword =>
      currentLanguage == 'ar' ? 'تأكيد كلمة المرور' : 'Confirm Password';

  static String get confirmPasswordHint => currentLanguage == 'ar'
      ? 'أعد إدخال كلمة المرور'
      : 'Re-enter your password';

  static String get registerButton =>
      currentLanguage == 'ar' ? 'تسجيل المشرف' : 'Register Admin';

  static String get registerSuccess => currentLanguage == 'ar'
      ? 'تم تسجيل المشرف بنجاح'
      : 'Admin registered successfully';

  static String get registerNewAdmin =>
      currentLanguage == 'ar' ? 'تسجيل مشرف جديد' : 'Register New Admin';

  static String get logoutConfirmTitle =>
      currentLanguage == 'ar' ? 'تسجيل الخروج' : 'Logout';

  static String get logoutConfirmMessage => currentLanguage == 'ar'
      ? 'هل أنت متأكد أنك تريد تسجيل الخروج؟'
      : 'Are you sure you want to logout?';

  static String get cancel => currentLanguage == 'ar' ? 'إلغاء' : 'Cancel';

  // ─── Settings ─────────────────────────────────────────
  static String get settingsTitle =>
      currentLanguage == 'ar' ? 'الإعدادات' : 'Settings';

  static String get settingsSubtitle => currentLanguage == 'ar'
      ? 'عرض معلومات حسابك وتغيير كلمة المرور'
      : 'View your account information and change your password';

  static String get changePasswordTitle =>
      currentLanguage == 'ar' ? 'تغيير كلمة المرور' : 'Change Password';

  static String get oldPassword =>
      currentLanguage == 'ar' ? 'كلمة المرور الحالية' : 'Current Password';

  static String get newPassword =>
      currentLanguage == 'ar' ? 'كلمة المرور الجديدة' : 'New Password';

  static String get confirmNewPassword => currentLanguage == 'ar'
      ? 'تأكيد كلمة المرور الجديدة'
      : 'Confirm New Password';

  static String get changePasswordButton =>
      currentLanguage == 'ar' ? 'تغيير كلمة المرور' : 'Change Password';

  static String get passwordChangedSuccess => currentLanguage == 'ar'
      ? 'تم تغيير كلمة المرور بنجاح'
      : 'Password changed successfully';

  static String get activeStatus => currentLanguage == 'ar' ? 'نشط' : 'Active';

  static String get inactiveStatus =>
      currentLanguage == 'ar' ? 'غير نشط' : 'Inactive';

  static String get settings =>
      currentLanguage == 'ar' ? 'الإعدادات' : 'Settings';

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
      ? 'يدعم ملفات PDF فقط'
      : 'Supports PDF files only';

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

  static String get uploadProcessingNotice => currentLanguage == 'ar'
      ? 'يتم الآن معالجة وتحليل الملف باستخدام الذكاء الاصطناعي. عند اكتمال الحالة سيظهر في قائمة العروض المتاحة.'
      : 'Your file is being processed and analyzed by AI. Once its status becomes completed, it will appear in the available offers list.';

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

  static String get compareResults =>
      currentLanguage == 'ar' ? 'نتائج المقارنة' : 'Compare Results';

  static String get comparedItems =>
      currentLanguage == 'ar' ? 'عناصر تمت مقارنتها' : 'Compared Items';

  static String get noComparedResults => currentLanguage == 'ar'
      ? 'لا توجد نتائج مقارنة حتى الآن'
      : 'No compare results yet';

  static String get generateProposalAction =>
      currentLanguage == 'ar' ? 'إنشاء مقترح شراء' : 'Generate Proposal';

  static String get compareBeforeGenerate => currentLanguage == 'ar'
      ? 'قم بالمقارنة أولاً قبل إنشاء المقترح'
      : 'Compare first before generating proposal';

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

  // ─── Shared Labels & Messages ─────────────────────
  static String get appTitle => currentLanguage == 'ar'
      ? 'لوحة إدارة فارماتشيو'
      : 'Pharmacio Admin Panel';

  static String get retry =>
      currentLanguage == 'ar' ? 'إعادة المحاولة' : 'Retry';

  static String get view => currentLanguage == 'ar' ? 'عرض' : 'View';

  static String get delete => currentLanguage == 'ar' ? 'حذف' : 'Delete';

  static String get close => currentLanguage == 'ar' ? 'إغلاق' : 'Close';

  static String get confirmDelete =>
      currentLanguage == 'ar' ? 'تأكيد الحذف' : 'Confirm Delete';

  static String deleteFileQuestion(String fileName) => currentLanguage == 'ar'
      ? 'هل تريد حذف "$fileName"؟'
      : 'Delete "$fileName"?';

  static String get fileDeleted =>
      currentLanguage == 'ar' ? 'تم حذف الملف' : 'File deleted';

  static String get statusUpdated =>
      currentLanguage == 'ar' ? 'تم تحديث الحالة' : 'Status updated';

  static String get noUploadsYet =>
      currentLanguage == 'ar' ? 'لا توجد تحميلات' : 'No uploads yet';

  static String get noRecentActivity =>
      currentLanguage == 'ar' ? 'لا يوجد نشاط حديث' : 'No recent activity';

  static String get switchLanguageLabel =>
      currentLanguage == 'ar' ? 'English' : 'العربية';

  static String get lightMode =>
      currentLanguage == 'ar' ? 'وضع فاتح' : 'Light Mode';

  static String get darkMode =>
      currentLanguage == 'ar' ? 'وضع داكن' : 'Dark Mode';

  static String get notificationMarkedAsRead => currentLanguage == 'ar'
      ? 'تم تعليم الإشعار كمقروء'
      : 'Notification marked as read';

  static String get passwordMinLengthError => currentLanguage == 'ar'
      ? 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل'
      : 'Password must be at least 8 characters';

  static String get passwordsDoNotMatch => currentLanguage == 'ar'
      ? 'كلمتا المرور غير متطابقتين'
      : 'Passwords do not match';

  // ─── Compare ───────────────────────────────────────
  static String get proposalGeneratedSuccess => currentLanguage == 'ar'
      ? 'تم إنشاء المقترح بنجاح'
      : 'Proposal generated successfully';

  static String get noAvailableOffers =>
      currentLanguage == 'ar' ? 'لا توجد عروض متاحة' : 'No available offers';

  static String get unassigned =>
      currentLanguage == 'ar' ? 'غير مخصص' : 'Unassigned';

  static String get unknown =>
      currentLanguage == 'ar' ? 'غير معروف' : 'Unknown';

  // ─── Proposals ─────────────────────────────────────
  static String get proposalApprovedSuccess => currentLanguage == 'ar'
      ? 'تمت الموافقة على المقترح'
      : 'Proposal approved successfully';

  static String get proposalRejectedSuccess => currentLanguage == 'ar'
      ? 'تم رفض المقترح'
      : 'Proposal rejected successfully';

  static String get currentStatusLabel =>
      currentLanguage == 'ar' ? 'الحالة الحالية' : 'Current status';

  static String proposalNumber(String proposalId) => currentLanguage == 'ar'
      ? 'المقترح #$proposalId'
      : 'Proposal #$proposalId';

  static String get chooseProposalActionDescription => currentLanguage == 'ar'
      ? 'اختر الإجراء المطلوب لهذا المقترح'
      : 'Choose the action you want for this proposal';

  static String get details => currentLanguage == 'ar' ? 'التفاصيل' : 'Details';

  static String get cannotContinueMissingProposalId => currentLanguage == 'ar'
      ? 'لا يمكن تنفيذ العملية لأن المعرف غير متوفر'
      : 'Cannot continue because proposal id is missing';

  static String get approveAction =>
      currentLanguage == 'ar' ? 'موافقة' : 'Approve';

  static String get rejectAction => currentLanguage == 'ar' ? 'رفض' : 'Reject';

  static String get total => currentLanguage == 'ar' ? 'الإجمالي' : 'Total';

  static String get proposalDetailsSubtitle => currentLanguage == 'ar'
      ? 'تفاصيل كاملة للمقترح والعناصر المرتبطة به'
      : 'Full details for the proposal and its line items';

  static String get proposalSummary =>
      currentLanguage == 'ar' ? 'ملخص المقترح' : 'Proposal Summary';

  static String get proposalItems =>
      currentLanguage == 'ar' ? 'عناصر المقترح' : 'Proposal Items';

  static String get noItemsFound =>
      currentLanguage == 'ar' ? 'لا توجد عناصر' : 'No items found';

  static String get totalCostLabel =>
      currentLanguage == 'ar' ? 'الإجمالي' : 'Total Cost';

  static String get approvedByLabel =>
      currentLanguage == 'ar' ? 'تمت الموافقة بواسطة' : 'Approved By';

  static String get createdAtLabel =>
      currentLanguage == 'ar' ? 'تاريخ الإنشاء' : 'Created At';

  static String get updatedAtLabel =>
      currentLanguage == 'ar' ? 'آخر تحديث' : 'Updated At';

  static String get company => currentLanguage == 'ar' ? 'الشركة' : 'Company';

  static String get qty => currentLanguage == 'ar' ? 'الكمية' : 'Qty';

  static String get unit => currentLanguage == 'ar' ? 'السعر' : 'Unit';

  // ─── Inventory ─────────────────────────────────────
  static String get inventoryItemCreatedSuccess => currentLanguage == 'ar'
      ? 'تم إنشاء عنصر المخزون بنجاح'
      : 'Inventory item created successfully';

  static String get inventoryQuantityAdjustedSuccess => currentLanguage == 'ar'
      ? 'تم تعديل الكمية بنجاح'
      : 'Inventory quantity adjusted successfully';

  static String get addItem =>
      currentLanguage == 'ar' ? 'إضافة عنصر' : 'Add Item';

  static String get recordSale =>
      currentLanguage == 'ar' ? 'تسجيل بيع' : 'Record Sale';

  static String get createInventoryItem =>
      currentLanguage == 'ar' ? 'إضافة عنصر مخزون' : 'Create Inventory Item';

  static String get enterInventoryDetails => currentLanguage == 'ar'
      ? 'أدخل بيانات العنصر الجديد'
      : 'Enter details for the new inventory item';

  static String get recordInventorySale =>
      currentLanguage == 'ar' ? 'تسجيل عملية بيع' : 'Record Inventory Sale';

  static String get enterSaleDetails => currentLanguage == 'ar'
      ? 'أدخل بيانات عملية البيع'
      : 'Enter sale details';

  static String get productName =>
      currentLanguage == 'ar' ? 'اسم المنتج' : 'Product Name';

  static String get strength =>
      currentLanguage == 'ar' ? 'التركيز' : 'Strength';

  static String get quantityOnHand =>
      currentLanguage == 'ar' ? 'الكمية المتوفرة' : 'Quantity On Hand';

  static String get inventoryItem =>
      currentLanguage == 'ar' ? 'عنصر المخزون' : 'Inventory Item';

  static String get quantitySold =>
      currentLanguage == 'ar' ? 'الكمية المباعة' : 'Quantity Sold';

  static String get unitPrice =>
      currentLanguage == 'ar' ? 'سعر الوحدة' : 'Unit Price';

  static String get soldAt => currentLanguage == 'ar' ? 'وقت البيع' : 'Sold At';

  static String get soldAtIsoHint => currentLanguage == 'ar'
      ? 'تاريخ/وقت البيع (ISO 8601)'
      : 'Sale date/time (ISO 8601)';

  static String get minThreshold =>
      currentLanguage == 'ar' ? 'حد التنبيه الأدنى' : 'Min Threshold';

  static String get save => currentLanguage == 'ar' ? 'حفظ' : 'Save';

  static String get validValuesForAllFields => currentLanguage == 'ar'
      ? 'يرجى إدخال كل القيم بشكل صحيح'
      : 'Please provide valid values for all fields';

  static String get validSaleValues => currentLanguage == 'ar'
      ? 'يرجى إدخال بيانات بيع صحيحة'
      : 'Please provide valid sale values';

  static String get noInventoryItemsToSell => currentLanguage == 'ar'
      ? 'لا توجد عناصر مخزون متاحة للبيع'
      : 'No inventory items available for sale';

  static String get inventoryIdsUnavailable => currentLanguage == 'ar'
      ? 'تعذر جلب معرفات الأدوية من واجهة المخزون الخاصة بالبيع'
      : 'Could not fetch drug ids from sale inventory API';

  static String get cannotAdjustItemMissingId => currentLanguage == 'ar'
      ? 'تعذر تعديل العنصر لعدم توفر رقم التعريف'
      : 'Cannot adjust this item because id is missing';

  static String get cannotRecordSaleMissingId => currentLanguage == 'ar'
      ? 'تعذر تسجيل البيع لعدم توفر رقم تعريف العنصر'
      : 'Cannot record sale because inventory id is missing';

  static String saleRecordedSuccess(int remainingQuantity) =>
      currentLanguage == 'ar'
      ? 'تم تسجيل البيع بنجاح. الكمية المتبقية: $remainingQuantity'
      : 'Sale recorded successfully. Remaining quantity: $remainingQuantity';

    static String inventorySaleOptionLabel({
        required String product,
        required int inventoryId,
        required int quantity,
    }) => currentLanguage == 'ar'
            ? '$product - رقم: $inventoryId - الكمية: $quantity'
            : '$product - ID: $inventoryId - Qty: $quantity';

  static String adjustQuantityTitle(String product) => currentLanguage == 'ar'
      ? 'تعديل الكمية: $product'
      : 'Adjust Quantity: $product';

  static String get adjustmentHint => currentLanguage == 'ar'
      ? 'التعديل (مثال: -5 أو 10)'
      : 'Adjustment (e.g. -5, 10)';

  static String get reason => currentLanguage == 'ar' ? 'السبب' : 'Reason';

  static String get validAdjustmentAndReason => currentLanguage == 'ar'
      ? 'يرجى إدخال قيمة تعديل وسبب صحيحين'
      : 'Please provide a valid adjustment and reason';

  static String get apply => currentLanguage == 'ar' ? 'تنفيذ' : 'Apply';

  // ─── Alert Severities ─────────────────────────────
  static String get severityAll =>
      currentLanguage == 'ar' ? 'جميع المستويات' : 'All Severities';

  static String get severityCritical =>
      currentLanguage == 'ar' ? 'حرج' : 'Critical';

  static String get severityWarning =>
      currentLanguage == 'ar' ? 'تحذير' : 'Warning';

  static String get severityInfo =>
      currentLanguage == 'ar' ? 'معلومات' : 'Info';

  // ─── Alert Titles ───────────────────────────────
  static String get alertTitleLowStock =>
      currentLanguage == 'ar' ? 'تنبيه انخفاض المخزون' : 'Low Stock Alert';

  static String get alertTitleInventory =>
      currentLanguage == 'ar' ? 'إشعار المخزون' : 'Inventory Notification';

  static String get alertTitleSales =>
      currentLanguage == 'ar' ? 'إشعار المبيعات' : 'Sales Notification';

  static String get alertTitleUpload =>
      currentLanguage == 'ar' ? 'إشعار الرفع' : 'Upload Notification';

  static String get alertTitleNotification =>
      currentLanguage == 'ar' ? 'إشعار' : 'Notification';
}
