import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/pos_checkout_request_body.dart';
import '../models/pos_transaction_response.dart';

abstract class PosRemoteDataSource {
  Future<PosTransactionResponse> checkout(PosCheckoutRequestBody requestBody);
  Future<List<PosTransactionResponse>> getTransactions();
  Future<PosTransactionResponse> getReceipt(int transactionId);
  Future<PosTransactionResponse> refund(int transactionId);
}

class PosRemoteDataSourceImp implements PosRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  PosRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<PosTransactionResponse> checkout(
    PosCheckoutRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.posCheckout,
        body: requestBody.toJson(),
        token: _accessToken,
      );
      return PosTransactionResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<List<PosTransactionResponse>> getTransactions() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.posTransactions,
        token: _accessToken,
      );
      return (request as List)
          .map((i) => PosTransactionResponse.fromJson(i as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PosTransactionResponse> getReceipt(int transactionId) async {
    try {
      final request = await apiServicesImpl.get(
        '${AppLinkUrl.posTransactions}$transactionId/receipt/',
        token: _accessToken,
      );
      return PosTransactionResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<PosTransactionResponse> refund(int transactionId) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.posTransactions}$transactionId/refund/',
        token: _accessToken,
      );
      return PosTransactionResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
