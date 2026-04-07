import 'package:dio/dio.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helpers/app_shared_preferences.dart';
import '../../../../core/networking/api_services_impl.dart';
import '../../../../core/networking/app_link_url.dart';
import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../models/inventory_adjust_request_body.dart';
import '../models/inventory_adjust_response.dart';
import '../models/inventory_api_item.dart';
import '../models/inventory_create_request_body.dart';
import '../models/inventory_list_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryListResponse> getInventoryList();

  Future<InventoryApiItem> createInventoryItem(
    InventoryCreateRequestBody requestBody,
  );

  Future<InventoryAdjustResponse> adjustInventoryItem({
    required int inventoryId,
    required InventoryAdjustRequestBody requestBody,
  });
}

class InventoryRemoteDataSourceImp implements InventoryRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  InventoryRemoteDataSourceImp({required this.apiServicesImpl});

  String? get _accessToken =>
      AppSharedPreferences().getString(AppSharedPrefKeys.accessToken) ??
      AppSharedPreferences().getString(AppSharedPrefKeys.refreshToken);

  @override
  Future<InventoryListResponse> getInventoryList() async {
    try {
      final request = await apiServicesImpl.get(
        AppLinkUrl.inventory,
        token: _accessToken,
      );
      return InventoryListResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryApiItem> createInventoryItem(
    InventoryCreateRequestBody requestBody,
  ) async {
    try {
      final request = await apiServicesImpl.post(
        AppLinkUrl.inventory,
        body: requestBody.toJson(),
        token: _accessToken,
      );
      return InventoryApiItem.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<InventoryAdjustResponse> adjustInventoryItem({
    required int inventoryId,
    required InventoryAdjustRequestBody requestBody,
  }) async {
    try {
      final request = await apiServicesImpl.post(
        '${AppLinkUrl.inventory}$inventoryId/adjust/',
        body: requestBody.toJson(),
        token: _accessToken,
      );
      return InventoryAdjustResponse.fromJson(request as Map<String, dynamic>);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
