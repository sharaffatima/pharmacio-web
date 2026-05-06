// part '../states/opening_balance_state.dart';
// part 'opening_balance_cubit.freezed.dart';

// class OpeningBalanceCubit extends Cubit<OpeningBalanceState> {
//   final OpeningBalanceRepo _openingBalanceRepo;

//   OpeningBalanceCubit(this._openingBalanceRepo) : super(const OpeningBalanceState.initial());

//   Future<void> importExcelFiles(List<PlatformFile> files, {required String warehouseName}) async {
//     if (state is OpeningBalanceLoading) return;
//     emit(const OpeningBalanceState.loading());
//     try {
//       final response = await _openingBalanceRepo.importExcelFile(
//         files,
//         warehouseName: warehouseName,
//       );

//       emit(OpeningBalanceState.importSuccess(response));
//     } catch (e) {
//       final exception = NetworkExceptions.getException(e);
//       final message = NetworkExceptions.getErrorMessage(exception);
//       emit(OpeningBalanceState.error(error: message));
//     }
//   }
// }
