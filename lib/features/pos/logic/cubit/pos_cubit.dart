import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../inventory/data/models/inventory_api_item.dart';
import '../../../inventory/data/repos/inventory_repo.dart';
import '../../data/models/pos_barcode_lookup_response.dart';
import '../../data/models/pos_checkout_request_body.dart';
import '../../data/models/pos_transaction_response.dart';
import '../../data/repos/pos_repo.dart';

part '../states/pos_state.dart';
part 'pos_cubit.freezed.dart';

class PosCubit extends Cubit<PosState> {
  final PosRepo _posRepo;
  final InventoryRepo _inventoryRepo;

  PosCubit(this._posRepo, this._inventoryRepo)
    : super(const PosState.initial());

  List<PosTransactionResponse> _allTransactions = [];
  List<InventoryApiItem> _inventoryItems = [];

  List<PosTransactionResponse> get transactions => _allTransactions;
  List<InventoryApiItem> get inventoryItems => _inventoryItems;

  Future<void> loadTransactions() async {
    emit(const PosState.loading());
    try {
      _allTransactions = await _posRepo.getTransactions();
      emit(PosState.successGetTransactions(_allTransactions));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(PosState.error(error: message));
    }
  }

  Future<void> fetchInventoryItems() async {
    try {
      final response = await _inventoryRepo.getInventoryList();
      _inventoryItems = response.results ?? [];
    } catch (e) {
      // Handle error implicitly or add a specific state if required
    }
  }

  Future<void> checkout(PosCheckoutRequestBody requestBody) async {
    emit(const PosState.loading());
    try {
      final response = await _posRepo.checkout(requestBody);
      emit(PosState.successCheckout(response));
      await loadTransactions();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(PosState.error(error: message));
    }
  }

  Future<void> refund(int transactionId) async {
    emit(const PosState.loading());
    try {
      final response = await _posRepo.refund(transactionId);
      emit(PosState.successRefund(response));
      await loadTransactions();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(PosState.error(error: message));
    }
  }

  Future<void> getReceipt(int transactionId) async {
    emit(const PosState.loading());
    try {
      final response = await _posRepo.getReceipt(transactionId);
      emit(PosState.successGetReceipt(response));
      // Re-emit transactions to maintain the list view state
      emit(PosState.successGetTransactions(_allTransactions));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(PosState.error(error: message));
    }
  }

  Future<PosBarcodeLookupResponse> barcodeLookup(String barcode) async {
    try {
      return await _posRepo.barcodeLookup(barcode);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
