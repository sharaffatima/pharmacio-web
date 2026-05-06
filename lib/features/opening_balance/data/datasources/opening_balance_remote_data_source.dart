import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/opening_balance_response.dart';

abstract class OpeningBalanceRemoteDataSource {
  Future<OpeningBalanceResponse> importExcelFile(
    List<PlatformFile> files, {
    required String warehouseName,
  });
}

class OpeningBalanceRemoteDataSourceImp implements OpeningBalanceRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  OpeningBalanceRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<OpeningBalanceResponse> importExcelFile(
    List<PlatformFile> files, {
    required String warehouseName,
  }) async {
    try {
      final formData = FormData();

      // Attach warehouse name so the backend can persist it
      // alongside the uploaded file.
      formData.fields.add(MapEntry('warehouse_name', warehouseName));
      formData.fields.add(MapEntry('ware_house_name', warehouseName));

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
        AppLinkUrl.openingBalanceImport,
        formData: formData,
        token: _accessToken,
      );

      return OpeningBalanceResponse.fromJson(request);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}