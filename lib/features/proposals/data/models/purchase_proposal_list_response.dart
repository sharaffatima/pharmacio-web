import 'purchase_proposal_model.dart';

/// Maps to backend PageNumberPagination response:
/// {
///   "count": int,
///   "next": String?,
///   "previous": String?,
///   "results": [ { PurchaseProposal }, ... ]
/// }
class PurchaseProposalListResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<PurchaseProposalModel> results;

  const PurchaseProposalListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PurchaseProposalListResponse.fromJson(Map<String, dynamic> json) {
    // Handle both paginated { results: [...] } and direct list fallback
    final rawResults = json['results'] as List<dynamic>? ?? [];
    return PurchaseProposalListResponse(
      count: json['count'] as int? ?? rawResults.length,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: rawResults
          .map((e) => PurchaseProposalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
