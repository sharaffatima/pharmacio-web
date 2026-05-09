part of '../cubit/pos_cubit.dart';

@freezed
class PosState with _$PosState {
  const factory PosState.initial() = PosInitial;
  const factory PosState.loading() = PosLoading;
  const factory PosState.successGetTransactions(List<PosTransactionResponse> transactions) = SuccessGetTransactions;
  const factory PosState.successCheckout(PosTransactionResponse transaction) = SuccessCheckout;
  const factory PosState.successRefund(PosTransactionResponse transaction) = SuccessRefund;
  const factory PosState.successGetReceipt(PosTransactionResponse receipt) = SuccessGetReceipt;
  const factory PosState.error({required String error}) = PosError;
}
