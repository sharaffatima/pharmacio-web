import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/compare_offers_request_body.dart';
import '../models/drug_comparison_model.dart';
import '../models/proposal_status_model.dart';
import '../models/purchase_proposal_list_response.dart';
import '../models/purchase_proposal_model.dart';

abstract class ProposalsRemoteDataSource {
  Future<List<DrugComparisonModel>> compareOffers(
    CompareOffersRequestBody body,
  );
  Future<PurchaseProposalModel> generateProposal(
    CompareOffersRequestBody body,
  );
  Future<List<PurchaseProposalModel>> getProposals();
  Future<PurchaseProposalModel> getProposalDetail(int id);
  Future<PurchaseProposalModel> approveProposal(int id);
  Future<PurchaseProposalModel> rejectProposal(int id);
  Future<ProposalStatusModel> getProposalStatus(int id);
}

class ProposalsRemoteDataSourceImp implements ProposalsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProposalsRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<List<DrugComparisonModel>> compareOffers(
    CompareOffersRequestBody body,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.purchaseProposalsCompare,
        body: body.toJson(),
        token: _accessToken,
      );
      final list = request as List<dynamic>;
      return list
          .map((e) => DrugComparisonModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PurchaseProposalModel> generateProposal(
    CompareOffersRequestBody body,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.purchaseProposalsGenerate,
        body: body.toJson(),
        token: _accessToken,
      );
      return PurchaseProposalModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<PurchaseProposalModel>> getProposals() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposals,
        token: _accessToken,
      );
      // Backend returns paginated response: { count, next, previous, results: [...] }
      final response = PurchaseProposalListResponse.fromJson(
        request as Map<String, dynamic>,
      );
      return response.results;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PurchaseProposalModel> getProposalDetail(int id) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposalDetail(id),
        token: _accessToken,
      );
      return PurchaseProposalModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PurchaseProposalModel> approveProposal(int id) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.purchaseProposalApprove(id),
        token: _accessToken,
      );
      return PurchaseProposalModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PurchaseProposalModel> rejectProposal(int id) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.purchaseProposalReject(id),
        token: _accessToken,
      );
      return PurchaseProposalModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<ProposalStatusModel> getProposalStatus(int id) async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposalStatus(id),
        token: _accessToken,
      );
      return ProposalStatusModel.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
