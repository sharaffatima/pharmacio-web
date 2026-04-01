import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/offer_model.dart';
import '../models/offers_list_response.dart';

abstract class OffersRemoteDataSource {
  Future<List<OfferModel>> getOffers();
}

class OffersRemoteDataSourceImp implements OffersRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  OffersRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<List<OfferModel>> getOffers() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.offers,
        token: _accessToken,
      );
      final response = OffersListResponse.fromJson(
        request as Map<String, dynamic>,
      );
      return response.results;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
