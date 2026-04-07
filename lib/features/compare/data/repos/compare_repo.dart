import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/compare_remote_data_source.dart';
import '../models/compare_available_offers_response.dart';
import '../models/compare_generated_proposal_response.dart';
import '../models/compare_offer_result_model.dart';
import '../models/compare_offers_request_body.dart';

class CompareRepo {
  final CompareRemoteDataSource compareRemoteDataSource;
  final NetworkInfo networkInfo;

  CompareRepo({
    required this.compareRemoteDataSource,
    required this.networkInfo,
  });

  Future<CompareAvailableOffersResponse> getAvailableOffers() async {
    if (await networkInfo.isConnected) {
      try {
        return await compareRemoteDataSource.getAvailableOffers();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<CompareOfferResultModel>> compareOffers(
    CompareOffersRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await compareRemoteDataSource.compareOffers(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<CompareGeneratedProposalResponse> generateProposal(
    CompareOffersRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await compareRemoteDataSource.generateProposal(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
