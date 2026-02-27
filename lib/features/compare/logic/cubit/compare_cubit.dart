import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation/widgets/available_offers_widget.dart';

part '../states/compare_state.dart';
part 'compare_cubit.freezed.dart';

class CompareCubit extends Cubit<CompareState> {
  CompareCubit() : super(const CompareState.initial());

  List<CompareOfferItem> _offers = [];

  int get selectedCount => _offers.where((o) => o.isSelected).length;

  void loadData() {
    emit(const CompareState.loading());
    _offers = CompareOfferItem.sampleData();
    emit(CompareState.success(List.from(_offers)));
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
