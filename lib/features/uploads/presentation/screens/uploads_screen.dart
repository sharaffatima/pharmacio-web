import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/public_widgets/loading_widget.dart';
import '../../../../core/public_widgets/responsive_scaffold.dart';
import '../../../../core/public_widgets/retry_button_widget.dart';
import '../../../../core/public_widgets/snack_bar_widget.dart';
import '../../data/models/upload_entry.dart';
import '../../logic/cubit/uploads_cubit.dart';
import '../widgets/recent_uploads_table_widget.dart';
import '../widgets/upload_dropzone_widget.dart';
import '../widgets/uploads_header_widget.dart';

class UploadsScreen extends StatelessWidget {
  const UploadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      selectedIndex: 1,
      title: AppStrings.uploads,
      body: BlocConsumer<UploadsCubit, UploadsState>(
        listener: (context, state) {
          state.whenOrNull(
            uploadSuccess: (response) =>
                showAppSnackBar(context, AppStrings.uploadProcessingNotice),
            statusSuccess: (response) => showAppSnackBar(
              context,
              response.message ?? AppStrings.statusUpdated,
            ),
            error: (error) => showAppSnackBar(context, error),
          );
        },
        builder: (context, state) {
          final cubit = context.watch<UploadsCubit>();
          final uploadsList = cubit.uploadsList;
          final isProcessing = cubit.isProcessing;

          Widget content = state.maybeWhen(
            loading: () => const LoadingWidget(),
            error: (error) => RetryButtonWidget(
              message: error,
              onRetry: () =>
                  context.read<UploadsCubit>().loadRecentlyUploadedFiles(),
            ),
            successDeletedFile: (successMsg) =>
                _buildContent(context, uploadsList, isProcessing),
            orElse: () => _buildContent(context, uploadsList, isProcessing),
          );

          return Stack(
            children: [
              content,
              if (isProcessing)
                Container(
                  color: AppColors.white.withValues(alpha: 0.6),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const LoadingWidget(),
                        verticalSpace(12),
                        Text(
                          AppStrings.processingDocumentPleaseWait,
                          style: AppTextStyles.font14BlackRegular,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<UploadEntry> uploads,
    bool isUploading,
  ) {
    final isMobile = MediaQuery.of(context).size.width < 900;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16.w : 32.w,
        vertical: isMobile ? 20.h : 28.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UploadsHeaderWidget(),
          verticalSpace(24),
          UploadDropzoneWidget(
            onBrowseFiles: () async {
              await context.read<UploadsCubit>().pickFiles();
            },
            warehouseController: context
                .read<UploadsCubit>()
                .warehouseNameController,
            isUploading: isUploading,
            formKey: context.read<UploadsCubit>().uploadFormKey,
          ),
          verticalSpace(24),
          RecentUploadsTableWidget(
            entries: uploads,
            onView: (i) => _viewFile(context, uploads[i]),
            onDelete: (i) => _deleteFile(context, i, uploads[i]),
          ),
        ],
      ),
    );
  }

  void _viewFile(BuildContext context, UploadEntry entry) {
    if (entry.bytes != null && entry.bytes!.isNotEmpty) {
      _showFilePreviewDialog(context, entry);
    } else {
      _showFileInfoDialog(context, entry);
    }
  }

  void _showFilePreviewDialog(BuildContext context, UploadEntry entry) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          width: 500.w,
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      entry.filename,
                      style: AppTextStyles.font16BlackSemiBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              verticalSpace(16),
              if (entry.type == 'Image' && entry.bytes != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.memory(
                    entry.bytes!,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 300.h,
                  ),
                )
              else
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(24.r),
                  decoration: BoxDecoration(
                    color: AppColors.offWhiteGrey,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.description_outlined,
                        size: 48.sp,
                        color: AppColors.coolGrey,
                      ),
                      verticalSpace(12),
                      Text(
                        entry.filename,
                        style: AppTextStyles.font14BlackRegular,
                      ),
                      verticalSpace(4),
                      Text(
                        '${entry.type} • ${entry.date}',
                        style: AppTextStyles.font13GreyRegular,
                      ),
                      verticalSpace(4),
                      Text(
                        _formatFileSize(entry.bytes!.length),
                        style: AppTextStyles.font12GreyRegular,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFileInfoDialog(BuildContext context, UploadEntry entry) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          width: 400.w,
          padding: EdgeInsets.all(24.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.description_outlined,
                size: 48.sp,
                color: AppColors.coolGrey,
              ),
              verticalSpace(16),
              Text(entry.filename, style: AppTextStyles.font16BlackSemiBold),
              verticalSpace(8),
              Text(
                '${entry.type} • ${entry.date}',
                style: AppTextStyles.font13GreyRegular,
              ),
              verticalSpace(8),
              Container(
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
              verticalSpace(20),
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: Text(
                  AppStrings.close,
                  style: AppTextStyles.font14BlackRegular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _deleteFile(BuildContext context, int index, UploadEntry entry) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Text(
          AppStrings.confirmDelete,
          style: AppTextStyles.font16BlackSemiBold,
        ),
        content: Text(
          AppStrings.deleteFileQuestion(entry.filename),
          style: AppTextStyles.font14BlackRegular,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.font14BlackRegular,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<UploadsCubit>().deleteFile(index);
              showAppSnackBar(context, AppStrings.fileDeleted);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brightRed,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(AppStrings.delete),
          ),
        ],
      ),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
