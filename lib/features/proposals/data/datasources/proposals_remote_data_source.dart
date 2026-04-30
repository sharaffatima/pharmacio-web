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

  /// Downloads the PDF for a single proposal as raw bytes.
  Future<List<int>> downloadProposalPdf(int proposalId);

  /// Downloads the ZIP bundle of every proposal as raw bytes.
  Future<List<int>> downloadAllProposalsZip();
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

  // ─── PDF / ZIP downloads ─────────────────────────────
  // Use a dedicated Dio instance configured for binary responses
  // because the shared ApiServicesImpl decodes everything as JSON.
  Dio _binaryDio() {
    final dio = Dio()
      ..options.baseUrl = AppLinkUrl.baseUrl
      ..options.responseType = ResponseType.bytes
      ..options.receiveTimeout = const Duration(minutes: 2)
      ..options.connectTimeout = const Duration(minutes: 1);
    final token = _accessToken;
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return dio;
  }

  @override
  Future<List<int>> downloadProposalPdf(int proposalId) async {
    try {
      final response = await _binaryDio().get<List<int>>(
        AppLinkUrl.purchaseProposalPdf(proposalId),
      );
      return response.data ?? <int>[];
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<int>> downloadAllProposalsZip() async {
    try {
      final response = await _binaryDio().get<List<int>>(
        AppLinkUrl.purchaseProposalsZip,
      );
      return response.data ?? <int>[];
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
