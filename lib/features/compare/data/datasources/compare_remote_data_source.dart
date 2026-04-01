import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/compare_model.dart';

abstract class CompareRemoteDataSource {
  Future<List<CompareModel>> compareOffers(List<int> ocrResultIds);
}

class CompareRemoteDataSourceImp implements CompareRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  CompareRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<List<CompareModel>> compareOffers(List<int> ocrResultIds) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.purchaseProposalsCompare,
        body: {'ocr_result_ids': ocrResultIds},
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => CompareModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
