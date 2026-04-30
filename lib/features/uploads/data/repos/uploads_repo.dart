import 'package:file_picker/file_picker.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/uploads_remote_data_source.dart';
import '../models/upload_response.dart';

class UploadsRepo {
  final UploadsRemoteDataSource uploadsRemoteDataSource;
  final NetworkInfo networkInfo;

  UploadsRepo({
    required this.uploadsRemoteDataSource,
    required this.networkInfo,
  });

  Future<UploadResponse> uploadFiles(
    List<PlatformFile> files, {
    required String warehouseName,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await uploadsRemoteDataSource.uploadFiles(
          files,
          warehouseName: warehouseName,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<UploadResponse> checkUploadStatus(String uploadId) async {
    if (await networkInfo.isConnected) {
      try {
        return await uploadsRemoteDataSource.checkUploadStatus(uploadId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
