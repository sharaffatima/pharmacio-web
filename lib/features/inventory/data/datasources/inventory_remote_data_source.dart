import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_item_response.dart';
import '../models/inventory_list_response.dart';
import '../models/sale_create_request_body.dart';
import '../models/sale_response.dart';

abstract class InventoryRemoteDataSource {
  Future<List<InventoryItemResponse>> getInventory();
  Future<InventoryItemResponse> createInventoryItem(
    InventoryCreateRequestBody body,
  );
  Future<InventoryAdjustResponse> adjustInventory(
    int id,
    InventoryAdjustRequestBody body,
  );
  Future<SaleResponse> recordSale(SaleCreateRequestBody body);
}

class InventoryRemoteDataSourceImp implements InventoryRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  InventoryRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<List<InventoryItemResponse>> getInventory() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.inventory,
        token: _accessToken,
      );
      // Backend returns paginated response: { count, next, previous, results: [...] }
      final response = InventoryListResponse.fromJson(
        request as Map<String, dynamic>,
      );
      return response.results;
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryItemResponse> createInventoryItem(
    InventoryCreateRequestBody body,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.inventory,
        body: body.toJson(),
        token: _accessToken,
      );
      return InventoryItemResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryAdjustResponse> adjustInventory(
    int id,
    InventoryAdjustRequestBody body,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.inventoryAdjust(id),
        body: body.toJson(),
        token: _accessToken,
      );
      return InventoryAdjustResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<SaleResponse> recordSale(SaleCreateRequestBody body) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.sales,
        body: body.toJson(),
        token: _accessToken,
      );
      return SaleResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
