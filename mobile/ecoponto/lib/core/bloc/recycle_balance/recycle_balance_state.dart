part of 'recycle_balance_bloc.dart';

@immutable
abstract class RecycleBalanceState {}

class RecycleBalanceInitial extends RecycleBalanceState {}

class RecycleBalanceLoading extends RecycleBalanceState {}

class RecycleBalanceLoaded extends RecycleBalanceState {
  final List<RecycleBalanceModel> recycleBalanceModel;
  RecycleBalanceLoaded({required this.recycleBalanceModel});
}

class RecycleBalanceError extends RecycleBalanceState {
  final String message;
  RecycleBalanceError({required this.message});
}