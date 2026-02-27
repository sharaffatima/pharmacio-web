part of '../cubit/uploads_cubit.dart';

@freezed
class UploadsState with _$UploadsState {
  const factory UploadsState.initial() = UploadsInitial;
  const factory UploadsState.loading() = UploadsLoading;
  const factory UploadsState.success(List<UploadEntry> uploads) =
      UploadsSuccess;
  const factory UploadsState.error({required String error}) = UploadsError;
}
