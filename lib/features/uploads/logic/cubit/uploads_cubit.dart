import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/colors.dart';
import '../../data/models/upload_entry.dart';

part '../states/uploads_state.dart';
part 'uploads_cubit.freezed.dart';

class UploadsCubit extends Cubit<UploadsState> {
  UploadsCubit() : super(const UploadsState.initial());

  List<UploadEntry> _uploads = [];

  void loadData() {
    emit(const UploadsState.loading());
    _uploads = UploadEntry.sampleData();
    emit(UploadsState.success(List.from(_uploads)));
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'xls',
        'xlsx',
        'doc',
        'docx',
        'png',
        'jpg',
        'jpeg',
      ],
      allowMultiple: true,
      withData: true,
    );

    if (result == null || result.files.isEmpty) return;

    final now = DateTime.now();
    final dateStr =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} '
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    for (final file in result.files) {
      final ext = file.extension ?? '';
      _uploads.insert(
        0,
        UploadEntry(
          filename: file.name,
          type: UploadEntry.typeFromExtension(ext),
          date: dateStr,
          status: AppStrings.completed,
          statusColor: AppColors.emerald,
          statusBgColor: AppColors.emerald.withValues(alpha: 0.1),
          bytes: file.bytes,
        ),
      );
    }

    emit(UploadsState.success(List.from(_uploads)));
  }

  void deleteFile(int index) {
    _uploads.removeAt(index);
    emit(UploadsState.success(List.from(_uploads)));
  }
}
