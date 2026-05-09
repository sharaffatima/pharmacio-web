import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/pos_remote_data_source.dart';
import '../models/pos_checkout_request_body.dart';
import '../models/pos_transaction_response.dart';

class PosRepo {
  final PosRemoteDataSource posRemoteDataSource;
  final NetworkInfo networkInfo;

  PosRepo({
    required this.posRemoteDataSource,
    required this.networkInfo,
  });

  Future<PosTransactionResponse> checkout(PosCheckoutRequestBody requestBody) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.checkout(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<PosTransactionResponse>> getTransactions() async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.getTransactions();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PosTransactionResponse> getReceipt(int transactionId) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.getReceipt(transactionId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PosTransactionResponse> refund(int transactionId) async {
    if (await networkInfo.isConnected) {
      try {
        return await posRemoteDataSource.refund(transactionId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
