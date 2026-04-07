import 'package:file_picker/file_picker.dart';
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

  void loadRecentlyUploadedFiles() {
    emit(const UploadsState.initial());
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: true,
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    emit(const UploadsState.loading());
    try {
      final response = await _uploadsRepo.uploadFiles(result.files);

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

      emit(UploadsState.uploadSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(UploadsState.error(error: message));
    }
  }

  Future<void> checkStatus(String uploadId) async {
    emit(const UploadsState.loading());
    try {
      final response = await _uploadsRepo.checkUploadStatus(uploadId);
      emit(UploadsState.statusSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(UploadsState.error(error: message));
    }
  }

  void deleteFile(int index) {
    uploadsList.removeAt(index);
    emit(UploadsState.successDeletedFile(AppStrings.fileDeleted));
  }
}
