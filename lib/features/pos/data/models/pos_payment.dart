import 'package:freezed_annotation/freezed_annotation.dart';

part 'pos_payment.g.dart';

@JsonSerializable()
class PosPayment {
  final int? id;
  @JsonKey(name: 'payment_method')
  final String? paymentMethod;
  @JsonKey(name: 'amount_paid')
  final String? amountPaid;

  PosPayment({
    this.id,
    this.paymentMethod,
    this.amountPaid,
  });

  factory PosPayment.fromJson(Map<String, dynamic> json) => _$PosPaymentFromJson(json);
  Map<String, dynamic> toJson() => _$PosPaymentToJson(this);
}
