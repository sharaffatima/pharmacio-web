import 'package:freezed_annotation/freezed_annotation.dart';

import 'pos_item.dart';
import 'pos_payment.dart';

part 'pos_transaction_response.g.dart';

@JsonSerializable()
class PosTransactionResponse {
  final int? id;
  @JsonKey(name: 'receipt_number')
  final String? receiptNumber;
  final int? cashier;
  @JsonKey(name: 'cashier_name')
  final String? cashierName;
  final String? status;
  @JsonKey(name: 'discount_percentage')
  final String? discountPercentage;
  final String? subtotal;
  @JsonKey(name: 'total_amount')
  final String? totalAmount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  final List<PosItem>? items;
  final List<PosPayment>? payments;

  PosTransactionResponse({
    this.id,
    this.receiptNumber,
    this.cashier,
    this.cashierName,
    this.status,
    this.discountPercentage,
    this.subtotal,
    this.totalAmount,
    this.createdAt,
    this.updatedAt,
    this.items,
    this.payments,
  });

  factory PosTransactionResponse.fromJson(Map<String, dynamic> json) => _$PosTransactionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PosTransactionResponseToJson(this);
}
