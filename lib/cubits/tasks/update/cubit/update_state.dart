part of 'update_cubit.dart';

sealed class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

final class UpdateInitial extends UpdateState {}

final class UpdateTaskLoadingState extends UpdateState {}

final class UpdateTaskSuccessState extends UpdateState {}

final class UpdateTaskFailureState extends UpdateState {
  final Failure errorMsg;
  const UpdateTaskFailureState(this.errorMsg);
}
