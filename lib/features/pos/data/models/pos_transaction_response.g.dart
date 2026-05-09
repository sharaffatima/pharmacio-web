// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pos_transaction_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PosTransactionResponse _$PosTransactionResponseFromJson(
  Map<String, dynamic> json,
) => PosTransactionResponse(
  id: (json['id'] as num?)?.toInt(),
  receiptNumber: json['receipt_number'] as String?,
  cashier: (json['cashier'] as num?)?.toInt(),
  cashierName: json['cashier_name'] as String?,
  status: json['status'] as String?,
  discountPercentage: json['discount_percentage'] as String?,
  subtotal: json['subtotal'] as String?,
  totalAmount: json['total_amount'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => PosItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  payments: (json['payments'] as List<dynamic>?)
      ?.map((e) => PosPayment.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PosTransactionResponseToJson(
  PosTransactionResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'receipt_number': instance.receiptNumber,
  'cashier': instance.cashier,
  'cashier_name': instance.cashierName,
  'status': instance.status,
  'discount_percentage': instance.discountPercentage,
  'subtotal': instance.subtotal,
  'total_amount': instance.totalAmount,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'items': instance.items,
  'payments': instance.payments,
};
