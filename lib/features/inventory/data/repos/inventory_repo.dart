import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/inventory_remote_data_source.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_api_item.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_list_response.dart';
import '../models/inventory_sale_request_body.dart';
import '../models/inventory_sale_response.dart';

class InventoryRepo {
  final InventoryRemoteDataSource inventoryRemoteDataSource;
  final NetworkInfo networkInfo;

  InventoryRepo({
    required this.inventoryRemoteDataSource,
    required this.networkInfo,
  });

  Future<InventoryListResponse> getInventoryList() async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.getInventoryList();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryApiItem> createInventoryItem(
    InventoryCreateRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.createInventoryItem(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryAdjustResponse> adjustInventoryItem({
    required int inventoryId,
    required InventoryAdjustRequestBody requestBody,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.adjustInventoryItem(
          inventoryId: inventoryId,
          requestBody: requestBody,
        );
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventorySaleResponse> recordSale(
    InventorySaleRequestBody requestBody,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.recordSale(requestBody);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
