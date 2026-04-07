import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/proposal_status_response.dart';
import '../models/purchase_proposal_model.dart';
import '../models/purchase_proposals_response.dart';

abstract class ProposalsRemoteDataSource {
  Future<PurchaseProposalsResponse> getProposalsList();

  Future<PurchaseProposalModel> getProposalDetail(int proposalId);

  Future<PurchaseProposalModel> approveProposal(int proposalId);

  Future<PurchaseProposalModel> rejectProposal(int proposalId);

  Future<ProposalStatusResponse> getProposalStatus(int proposalId);
}

class ProposalsRemoteDataSourceImp implements ProposalsRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  ProposalsRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<PurchaseProposalsResponse> getProposalsList() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.purchaseProposals,
        token: _accessToken,
      );
      return PurchaseProposalsResponse.fromJson(
        request as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PurchaseProposalModel> getProposalDetail(int proposalId) async {
    try {
      final request = await apiServicesImpl.get(
        '${AppLinkUrl.purchaseProposals}$proposalId/',
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
  Future<PurchaseProposalModel> approveProposal(int proposalId) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.purchaseProposals}$proposalId/approve/',
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
  Future<PurchaseProposalModel> rejectProposal(int proposalId) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.purchaseProposals}$proposalId/reject/',
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
  Future<ProposalStatusResponse> getProposalStatus(int proposalId) async {
    try {
      final request = await apiServicesImpl.get(
        '${AppLinkUrl.purchaseProposals}$proposalId/status/',
        token: _accessToken,
      );
      return ProposalStatusResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
