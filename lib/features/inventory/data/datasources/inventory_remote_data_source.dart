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
import '../models/inventory_sale_request_body.dart';
import '../models/inventory_sale_response.dart';

abstract class InventoryRemoteDataSource {
  Future<InventoryListResponse> getInventoryList();

  Future<InventoryApiItem> createInventoryItem(
    InventoryCreateRequestBody requestBody,
  );

  Future<InventoryAdjustResponse> adjustInventoryItem({
    required int inventoryId,
    required InventoryAdjustRequestBody requestBody,
  });

  Future<InventorySaleResponse> recordSale(
    InventorySaleRequestBody requestBody,
  );
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

  @override
  Future<InventorySaleResponse> recordSale(
    InventorySaleRequestBody requestBody,
  ) async {
    try {
      // Backend replaced /sales/ with the POS checkout flow. The
      // single-item "Record Sale" dialog wraps its input into a one-item
      // cart paid in cash so the existing UX still works.
      final amount = (double.tryParse(requestBody.unitPrice) ?? 0) *
          requestBody.quantitySold;
      final amountPaid = amount.toStringAsFixed(2);
      final body = {
        'items': [
          {
            'inventory_id': requestBody.inventoryId,
            'quantity': requestBody.quantitySold,
            'unit_price': requestBody.unitPrice,
          },
        ],
        'payments': [
          {
            'payment_method': 'cash',
            'amount_paid': amountPaid,
          },
        ],
      };
      final request = await apiServicesImpl.post(
        AppLinkUrl.posCheckout,
        body: body,
        token: _accessToken,
      );
      return _parseSaleResponse(request, fallback: requestBody);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  /// POS checkout returns a transaction wrapper rather than the legacy
  /// flat sale shape. Read whichever of the two formats the backend
  /// returns, falling back to the request payload so the UI still
  /// surfaces a sensible "remaining quantity" message.
  InventorySaleResponse _parseSaleResponse(
    dynamic raw, {
    required InventorySaleRequestBody fallback,
  }) {
    if (raw is! Map) {
      return InventorySaleResponse(
        inventoryId: fallback.inventoryId,
        quantitySold: fallback.quantitySold,
        unitPrice: fallback.unitPrice,
        soldAt: fallback.soldAt,
      );
    }
    final json = Map<String, dynamic>.from(raw);
    final items = json['items'];
    Map<String, dynamic>? firstItem;
    if (items is List && items.isNotEmpty && items.first is Map) {
      firstItem = Map<String, dynamic>.from(items.first as Map);
    }
    final source = firstItem ?? json;
    int? remaining;
    final remainingRaw = source['remaining_quantity'] ??
        source['remaining'] ??
        source['inventory_remaining_quantity'];
    if (remainingRaw is num) {
      remaining = remainingRaw.toInt();
    } else if (remainingRaw is String) {
      remaining = int.tryParse(remainingRaw);
    }
    DateTime? soldAt;
    final soldAtRaw = json['created_at'] ?? source['sold_at'];
    if (soldAtRaw is String) {
      soldAt = DateTime.tryParse(soldAtRaw);
    }
    return InventorySaleResponse(
      id: json['id'] is int
          ? json['id'] as int
          : (firstItem?['id'] is int ? firstItem!['id'] as int : null),
      productName:
          (source['product_name'] ?? source['product'])?.toString(),
      strength: source['strength']?.toString(),
      quantitySold: source['quantity'] is num
          ? (source['quantity'] as num).toInt()
          : fallback.quantitySold,
      unitPrice: source['unit_price']?.toString() ?? fallback.unitPrice,
      soldAt: soldAt ?? fallback.soldAt,
      inventoryId: source['inventory_id'] is num
          ? (source['inventory_id'] as num).toInt()
          : fallback.inventoryId,
      remainingQuantity: remaining,
    );
  }
}
