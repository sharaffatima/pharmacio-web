import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/offers_remote_data_source.dart';
import '../models/available_offers_response.dart';

class OffersRepo {
  final OffersRemoteDataSource offersRemoteDataSource;
  final NetworkInfo networkInfo;

  OffersRepo({required this.offersRemoteDataSource, required this.networkInfo});

  Future<AvailableOffersResponse> getAvailableOffers() async {
    if (await networkInfo.isConnected) {
      try {
        return await offersRemoteDataSource.getAvailableOffers();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
