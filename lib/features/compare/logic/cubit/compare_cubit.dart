import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/compare_model.dart';
import '../../data/repos/compare_repo.dart';
import '../../presentation/widgets/available_offers_widget.dart';

part '../states/compare_state.dart';
part 'compare_cubit.freezed.dart';

class CompareCubit extends Cubit<CompareState> {
  final CompareRepo _compareRepo;

  CompareCubit(this._compareRepo) : super(const CompareState.initial());

  List<CompareOfferItem> _offers = [];
  List<CompareModel> _compareResults = [];

  int get selectedCount => _offers.where((o) => o.isSelected).length;

  /// Loads item list from previous OCR upload results.
  /// Real data should be provided by app flow; no mock data is used.
  void loadData() {
    emit(const CompareState.loading());
    _offers = [];
    emit(CompareState.success(List.from(_offers)));
  }

  /// Populates the list with real OCR results from the backend.
  /// Call this after upload processing completes and OCR results are available.
  void loadFromOcrResults(List<CompareOfferItem> realOffers) {
    emit(const CompareState.loading());
    _offers = realOffers;
    emit(CompareState.success(List.from(_offers)));
  }

  Future<void> requestCompareApi(List<int> ocrResultIds) async {
    emit(const CompareState.loading());
    try {
      _compareResults = await _compareRepo.compareOffers(ocrResultIds);
      // Keep the current offers view intact, but also store compare results.
      emit(CompareState.success(List.from(_offers)));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CompareState.error(error: message));
    }
  }

  void toggleOffer(int index) {
    _offers[index] = CompareOfferItem(
      name: _offers[index].name,
      supplier: _offers[index].supplier,
      items: _offers[index].items,
      date: _offers[index].date,
      isSelected: !_offers[index].isSelected,
    );
    emit(CompareState.success(List.from(_offers)));
  }
}
