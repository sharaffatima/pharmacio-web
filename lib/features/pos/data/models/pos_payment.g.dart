// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosPayment _$PosPaymentFromJson(Map<String, dynamic> json) => PosPayment(
  id: (json['id'] as num?)?.toInt(),
  paymentMethod: json['payment_method'] as String?,
  amountPaid: json['amount_paid'] as String?,
);

Map<String, dynamic> _$PosPaymentToJson(PosPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_method': instance.paymentMethod,
      'amount_paid': instance.amountPaid,
    };
