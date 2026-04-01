class OfferCandidateModel {
  final int offerId;
  final String wareHouseName;
  final String price;
  final int itemId;

  const OfferCandidateModel({
    required this.offerId,
    required this.wareHouseName,
    required this.price,
    required this.itemId,
  });

  factory OfferCandidateModel.fromJson(Map<String, dynamic> json) {
    return OfferCandidateModel(
      offerId: json['offer_id'] as int? ?? 0,
      wareHouseName: json['ware_house_name'] as String? ?? '',
      price: json['price']?.toString() ?? '0',
      itemId: json['item_id'] as int? ?? 0,
    );
  }
}

class DrugComparisonModel {
  final String drugKey;
  final String drugName;
  final String? company;
  final String status; // found | not_found
  final OfferCandidateModel? best;
  final List<OfferCandidateModel> alternatives;

  const DrugComparisonModel({
    required this.drugKey,
    required this.drugName,
    this.company,
    required this.status,
    this.best,
    required this.alternatives,
  });

  factory DrugComparisonModel.fromJson(Map<String, dynamic> json) {
    final rawAlts = json['alternatives'] as List<dynamic>? ?? [];
    final rawBest = json['best'];
    return DrugComparisonModel(
      drugKey: json['drug_key'] as String? ?? '',
      drugName: json['drug_name'] as String? ?? '',
      company: json['company'] as String?,
      status: json['status'] as String? ?? 'not_found',
      best: rawBest != null
          ? OfferCandidateModel.fromJson(rawBest as Map<String, dynamic>)
          : null,
      alternatives: rawAlts
          .map((e) =>
              OfferCandidateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
