import 'inventory_item_response.dart';

/// Maps to backend PageNumberPagination response:
/// {
///   "count": int,
///   "next": String?,
///   "previous": String?,
///   "results": [ { "product", "quantity", "status" }, ... ]
/// }
class InventoryListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<InventoryItemResponse> results;

  const InventoryListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory InventoryListResponse.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'] as List<dynamic>? ?? [];
    return InventoryListResponse(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: rawResults
          .map((e) => InventoryItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
