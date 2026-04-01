import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/compare_remote_data_source.dart';
import '../models/compare_model.dart';

class CompareRepo {
  final CompareRemoteDataSource compareRemoteDataSource;
  final NetworkInfo networkInfo;

  CompareRepo({
    required this.compareRemoteDataSource,
    required this.networkInfo,
  });

  Future<List<CompareModel>> compareOffers(List<int> ocrResultIds) async {
    if (await networkInfo.isConnected) {
      try {
        return await compareRemoteDataSource.compareOffers(ocrResultIds);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
