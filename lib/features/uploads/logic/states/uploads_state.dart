part of '../cubit/uploads_cubit.dart';

@freezed
class UploadsState with _$UploadsState {
  const factory UploadsState.initial() = UploadsInitial;
  const factory UploadsState.loading() = UploadsLoading;
  const factory UploadsState.error({required String error}) = UploadsError;

  // Upload APIs states
  const factory UploadsState.uploadSuccess(UploadResponse response) =
      UploadSuccessState;
  const factory UploadsState.successDeletedFile(String successMsg) = SuccessDeletedFile;

  // Status APIs states
  const factory UploadsState.statusSuccess(UploadResponse response) =
      StatusSuccessState;
}
