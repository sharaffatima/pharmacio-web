import '../../../../core/networking/network_info.dart';
import '../datasources/opening_balance_remote_data_source.dart';

class OpeningBalanceRepo {
  final OpeningBalanceRemoteDataSource openingBalanceRemoteDataSource;
  final NetworkInfo networkInfo;

  OpeningBalanceRepo({
    required this.openingBalanceRemoteDataSource,
    required this.networkInfo,
  });

  //  Future<OpeningBalanceResponse> importExcelFile(
  //   List<dynamic> files, {
  //   required String warehouseName,
  // }) async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       return await openingBalanceRemoteDataSource.importExcelFile(
  //         files,
  //         warehouseName: warehouseName,
  //       );
  //     } catch (e) {
  //       throw NetworkExceptions.getException(e);
  //     }
  //   } else {
  //     throw const NetworkExceptions.noInternetConnection();
  //   }
  // }
}
