import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/compare_available_offers_response.dart';
import '../models/compare_generated_proposal_response.dart';
import '../models/compare_offer_result_model.dart';
import '../models/compare_offers_request_body.dart';

abstract class CompareRemoteDataSource {
  Future<CompareAvailableOffersResponse> getAvailableOffers();

  Future<List<CompareOfferResultModel>> compareOffers(
    CompareOffersRequestBody requestBody,
  );

  Future<CompareGeneratedProposalResponse> generateProposal(
    CompareOffersRequestBody requestBody,
  );
}

class CompareRemoteDataSourceImp implements CompareRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  CompareRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<CompareAvailableOffersResponse> getAvailableOffers() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.availableOffers,
        token: _accessToken,
      );
      return CompareAvailableOffersResponse.fromJson(
        request as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<CompareOfferResultModel>> compareOffers(
    CompareOffersRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.compareOffers,
        body: requestBody.toJson(),
        token: _accessToken,
      );

      final list = request as List<dynamic>;
      return list
          .map(
            (item) => CompareOfferResultModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<CompareGeneratedProposalResponse> generateProposal(
    CompareOffersRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.generatePurchaseProposal,
        body: requestBody.toJson(),
        token: _accessToken,
      );
      return CompareGeneratedProposalResponse.fromJson(
        request as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
