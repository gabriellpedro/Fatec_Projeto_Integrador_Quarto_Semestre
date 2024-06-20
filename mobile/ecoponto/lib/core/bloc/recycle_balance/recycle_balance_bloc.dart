import 'package:ecoponto/core/repositories/recicle_balance_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecoponto/pages/recycle_balance.dart';

part 'recycle_balance_event.dart';
part 'recycle_balance_state.dart';

class RecycleBalanceBloc extends Bloc<RecycleBalanceEvent, RecycleBalanceState> {
  RecycleBalanceBloc() : super(RecycleBalanceInitial()) {
    final RecycleBalanceRepository recycleBalanceRepository = RecycleBalanceRepository();
    on<GetRecycleBalanceItems>((event, emit) async {
      try {
        emit(RecycleBalanceLoading());
        final baleanceItems = await recycleBalanceRepository.getRecycleBalanceItems();
        emit(RecycleBalanceLoaded(recycleBalanceModel: baleanceItems));
      } catch (e) {
        emit(RecycleBalanceError(message: e.toString()));
      }
    });
  }
}