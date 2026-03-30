import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/proposals_remote_data_source.dart';

class ProposalsRepo {
  final ProposalsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProposalsRepo({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<List<dynamic>> getProposals() async {
    if (await networkInfo.isConnected) {
      try {
        return await remoteDataSource.getProposals();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}