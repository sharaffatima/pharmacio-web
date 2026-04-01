import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../data/models/upload_entry.dart';

class RecentUploadsTableWidget extends StatelessWidget {
  final List<UploadEntry> entries;
  final ValueChanged<int> onView;
  final ValueChanged<int> onDelete;

  const RecentUploadsTableWidget({
    super.key,
    required this.entries,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.gainsboro, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.recentUploads,
            style: AppTextStyles.font16BlackSemiBold,
          ),
          verticalSpace(16),

          // ─── Table Header ─────────────────────────
          _buildHeaderRow(),
          Divider(color: AppColors.gainsboro, height: 1),

          // ─── Table Rows ───────────────────────────
          if (entries.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Center(
                child: Text(
                  AppStrings.currentLanguage == 'ar'
                      ? 'لا توجد تحميلات'
                      : 'No uploads yet',
                  style: AppTextStyles.font13GreyRegular,
                ),
              ),
            )
          else
            ...entries.asMap().entries.map(
              (e) => _buildDataRow(e.value, e.key),
            ),
        ],
      ),
    );
  }

  Widget _buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              AppStrings.filename,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.type,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              AppStrings.createdDate,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              AppStrings.status,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              AppStrings.actions,
              style: AppTextStyles.font13GreyRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(UploadEntry entry, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.gainsboro, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // ─── Filename ───────────────────────────
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 18.sp,
                  color: AppColors.coolGrey,
                ),
                horizontalSpace(8),
                Flexible(
                  child: Text(
                    entry.filename,
                    style: AppTextStyles.font13BlackMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // ─── Type ───────────────────────────────
          Expanded(
            flex: 1,
            child: Text(entry.type, style: AppTextStyles.font13GreyRegular),
          ),

          // ─── Date ───────────────────────────────
          Expanded(
            flex: 2,
            child: Text(entry.date, style: AppTextStyles.font13GreyRegular),
          ),

          // ─── Status Badge ───────────────────────
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: entry.statusBgColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  entry.status,
                  style: AppTextStyles.font12GreyRegular.copyWith(
                    color: entry.statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          // ─── Actions ────────────────────────────
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                InkWell(
                  onTap: () => onView(index),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Tooltip(
                    message: AppStrings.currentLanguage == 'ar'
                        ? 'عرض'
                        : 'View',
                    child: Icon(
                      Icons.visibility_outlined,
                      size: 20.sp,
                      color: AppColors.coolGrey,
                    ),
                  ),
                ),
                horizontalSpace(12),
                InkWell(
                  onTap: () => onDelete(index),
                  borderRadius: BorderRadius.circular(4.r),
                  child: Tooltip(
                    message: AppStrings.currentLanguage == 'ar'
                        ? 'حذف'
                        : 'Delete',
                    child: Icon(
                      Icons.delete_outline,
                      size: 20.sp,
                      color: AppColors.brightRed,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
