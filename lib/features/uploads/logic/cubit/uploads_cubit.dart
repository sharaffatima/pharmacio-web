import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/upload_entry.dart';
import '../../data/models/upload_response.dart';
import '../../data/repos/uploads_repo.dart';

part '../states/uploads_state.dart';
part 'uploads_cubit.freezed.dart';

class UploadsCubit extends Cubit<UploadsState> {
  final UploadsRepo _uploadsRepo;

  UploadsCubit(this._uploadsRepo) : super(const UploadsState.initial());

  List<UploadEntry> uploadsList = [];
  final TextEditingController warehouseNameController = TextEditingController();
  final GlobalKey<FormState> uploadFormKey = GlobalKey<FormState>();
  bool _isUploading = false;
  bool _isProcessing = false;

  bool get isProcessing => _isUploading || _isProcessing;

  void loadRecentlyUploadedFiles() {
    emit(const UploadsState.initial());
  }

  Future<void> pickFiles() async {
    if (isProcessing) {
      return;
    }

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'xls', 'xlsx'],
      allowMultiple: true,
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    final warehouseName = warehouseNameController.text.trim();
    if (warehouseName.isEmpty) {
      return;
    }

    _isUploading = true;
    emit(const UploadsState.loading());
    try {
      final response = await _uploadsRepo.uploadFiles(
        result.files,
        warehouseName: warehouseName,
      );

      final ext = result.files.first.extension ?? '';
      uploadsList.insert(
        0,
        UploadEntry(
          filename: response.originalFilename ?? '',
          type: UploadEntry.typeFromExtension(ext),
          date: response.createdAt ?? '',
          status: response.status ?? '',
          statusColor: AppColors.emerald,
          statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
          bytes: result.files.first.bytes,
        ),
      );

      _isProcessing = _isProcessingStatus(response.status);
      emit(UploadsState.uploadSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(UploadsState.error(error: message));
      _isProcessing = false;
    } finally {
      _isUploading = false;
    }
  }

  Future<void> checkStatus(String uploadId) async {
    emit(const UploadsState.loading());
    try {
      final response = await _uploadsRepo.checkUploadStatus(uploadId);
      _isProcessing = _isProcessingStatus(response.status);
      emit(UploadsState.statusSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(UploadsState.error(error: message));
      _isProcessing = false;
    }
  }

  void deleteFile(int index) {
    uploadsList.removeAt(index);
    emit(UploadsState.successDeletedFile(AppStrings.fileDeleted));
  }

  bool _isProcessingStatus(String? status) {
    final value = status?.toLowerCase().trim();
    if (value == null || value.isEmpty) {
      return true;
    }
    return value == 'processing' || value == 'pending' || value == 'queued';
  }

  @override
  Future<void> close() {
    warehouseNameController.dispose();
    return super.close();
  }
}
