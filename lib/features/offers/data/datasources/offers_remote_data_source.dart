import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/available_offers_response.dart';

abstract class OffersRemoteDataSource {
  Future<AvailableOffersResponse> getAvailableOffers();
}

class OffersRemoteDataSourceImp implements OffersRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  OffersRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<AvailableOffersResponse> getAvailableOffers() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.availableOffers,
        token: _accessToken,
      );
      return AvailableOffersResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
