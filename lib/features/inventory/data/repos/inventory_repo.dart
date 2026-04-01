import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/inventory_remote_data_source.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_item_response.dart';
import '../models/sale_create_request_body.dart';
import '../models/sale_response.dart';

class InventoryRepo {
  final InventoryRemoteDataSource inventoryRemoteDataSource;
  final NetworkInfo networkInfo;

  InventoryRepo({
    required this.inventoryRemoteDataSource,
    required this.networkInfo,
  });

  Future<List<InventoryItemResponse>> getInventory() async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.getInventory();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryItemResponse> createInventoryItem(
    InventoryCreateRequestBody body,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.createInventoryItem(body);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<InventoryAdjustResponse> adjustInventory(
    int id,
    InventoryAdjustRequestBody body,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.adjustInventory(id, body);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<SaleResponse> recordSale(SaleCreateRequestBody body) async {
    if (await networkInfo.isConnected) {
      try {
        return await inventoryRemoteDataSource.recordSale(body);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
