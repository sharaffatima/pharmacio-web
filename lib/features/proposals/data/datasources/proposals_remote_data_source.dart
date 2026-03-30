import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';

abstract class ProposalsRemoteDataSource {
  Future<List<dynamic>> getProposals();
}

class ProposalsRemoteDataSourceImpl implements ProposalsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProposalsRemoteDataSourceImpl({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
          AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<List<dynamic>> getProposals() async {
    try {
      final response = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposals,
        token: _accessToken,
      );

      return response is List ? response : [];
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}