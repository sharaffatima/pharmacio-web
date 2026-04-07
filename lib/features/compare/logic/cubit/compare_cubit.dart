import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../data/models/compare_available_offer_item.dart';
import '../../data/models/compare_generated_proposal_response.dart';
import '../../data/models/compare_offer_result_model.dart';
import '../../data/models/compare_offers_request_body.dart';
import '../../data/repos/compare_repo.dart';

part '../states/compare_state.dart';
part 'compare_cubit.freezed.dart';

class CompareCubit extends Cubit<CompareState> {
  final CompareRepo _compareRepo;

  CompareCubit(this._compareRepo) : super(const CompareState.initial());

  List<CompareAvailableOfferItem> _offers = [];
  final Set<int> _selectedOfferIds = <int>{};
  List<CompareOfferResultModel> _compareResults = [];
  CompareGeneratedProposalResponse? _generatedProposal;

  int get selectedCount => _selectedOfferIds.length;

  Future<void> loadData() async {
    emit(const CompareState.loading());

    try {
      final response = await _compareRepo.getAvailableOffers();
      _offers = response.results ?? [];
      _selectedOfferIds.clear();
      _compareResults = [];
      _generatedProposal = null;
      _emitAvailableOffers();
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CompareState.error(error: message));
    }
  }

  void toggleOffer(int offerId) {
    if (_selectedOfferIds.contains(offerId)) {
      _selectedOfferIds.remove(offerId);
    } else {
      _selectedOfferIds.add(offerId);
    }

    _compareResults = [];
    _generatedProposal = null;
    _emitAvailableOffers();
  }

  Future<void> compareSelectedOffers() async {
    if (selectedCount < 2) {
      return;
    }

    emit(const CompareState.loading());

    try {
      final results = await _compareRepo.compareOffers(
        CompareOffersRequestBody(ocrResultIds: _selectedOfferIds.toList()),
      );
      _compareResults = results;
      emit(
        CompareState.successCompareOffers(
          offers: List.from(_offers),
          selectedOfferIds: _selectedOfferIds.toList(),
          comparedResults: List.from(_compareResults),
          generatedProposal: _generatedProposal,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CompareState.error(error: message));
    }
  }

  Future<void> generateProposal() async {
    if (selectedCount < 2) {
      return;
    }

    emit(const CompareState.loading());

    try {
      final proposal = await _compareRepo.generateProposal(
        CompareOffersRequestBody(ocrResultIds: _selectedOfferIds.toList()),
      );
      _generatedProposal = proposal;
      emit(
        CompareState.successGenerateProposal(
          offers: List.from(_offers),
          selectedOfferIds: _selectedOfferIds.toList(),
          comparedResults: List.from(_compareResults),
          proposal: proposal,
        ),
      );
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(CompareState.error(error: message));
    }
  }

  void _emitAvailableOffers() {
    emit(
      CompareState.successGetAvailableOffers(
        offers: List.from(_offers),
        selectedOfferIds: _selectedOfferIds.toList(),
        comparedResults: List.from(_compareResults),
        generatedProposal: _generatedProposal,
      ),
    );
  }
}
