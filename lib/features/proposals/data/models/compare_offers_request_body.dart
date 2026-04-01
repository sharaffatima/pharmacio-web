class CompareOffersRequestBody {
  final List<int> ocrResultIds;

  const CompareOffersRequestBody({required this.ocrResultIds});

  Map<String, dynamic> toJson() => {'ocr_result_ids': ocrResultIds};
}
