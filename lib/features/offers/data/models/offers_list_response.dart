import 'offer_model.dart';

class OffersListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<OfferModel> results;

  const OffersListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory OffersListResponse.fromJson(Map<String, dynamic> json) {
    final rawResults = json['results'] as List<dynamic>? ?? [];
    return OffersListResponse(
      count: json['count'] as int? ?? 0,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: rawResults
          .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': results.map((e) => e.toJson()).toList(),
  };
}
