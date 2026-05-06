import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/opening_balance_response.dart';

part 'opening_balance_state.freezed.dart';

@freezed
class OpeningBalanceState with _$OpeningBalanceState {
  const factory OpeningBalanceState.initial() = _Initial;

  const factory OpeningBalanceState.loading() = _Loading;

  const factory OpeningBalanceState.importSuccess(
    OpeningBalanceResponse response,
  ) = _ImportSuccess;

  const factory OpeningBalanceState.error(String error) = _Error;
}
