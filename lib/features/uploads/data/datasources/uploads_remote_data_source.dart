import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/upload_response.dart';

abstract class UploadsRemoteDataSource {
  Future<UploadResponse> uploadFiles(
    List<PlatformFile> files, {
    required String warehouseName,
  });
  Future<UploadResponse> checkUploadStatus(String uploadId);
}

class UploadsRemoteDataSourceImp implements UploadsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  UploadsRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<UploadResponse> uploadFiles(
    List<PlatformFile> files, {
    required String warehouseName,
  }) async {
    try {
      final formData = FormData();

      // Attach warehouse name so the backend can persist it
      // alongside the uploaded file.
      formData.fields.add(MapEntry('warehouse_name', warehouseName));

      for (var file in files) {
        if (file.bytes != null) {
          formData.files.add(
            MapEntry(
              'file',
              MultipartFile.fromBytes(file.bytes!, filename: file.name),
            ),
          );
        }
      }

      final request = await apiServicesImpl.post(
        AppLinkUrl.upload,
        formData: formData,
        token: _accessToken,
      );

      return UploadResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<UploadResponse> checkUploadStatus(String uploadId) async {
    try {
      final request = await apiServicesImpl.get(
        '${AppLinkUrl.uploadStatus}$uploadId/status/',
        token: _accessToken,
      );
      return UploadResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
