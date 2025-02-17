import 'package:task_manger/errors/failure.dart';

abstract class TasksState {}

class TaskInitialState extends TasksState {}

class DeleteTaskLoadingState extends TasksState {}

class DeleteTaskSuccessState extends TasksState {}

class DeleteTaskFailureState extends TasksState {
  Failure error;
  DeleteTaskFailureState(this.error);
}

class DeleteTaskOutSideLoadingState extends TasksState {}

class DeleteTaskOutSideSuccessState extends TasksState {}

class DeleteTaskOutSideFailureState extends TasksState {
  Failure error;
  DeleteTaskOutSideFailureState(this.error);
}

class UpdateTaskLoadingState extends TasksState {}

class UpdateTaskSuccessState extends TasksState {}

class UpdateTaskFailureState extends TasksState {
  Failure error;
  UpdateTaskFailureState(this.error);
}

class GetAllTaskLoadingState extends TasksState {}

class GetAllTaskSuccessState extends TasksState {}

class GetAllTaskFailureState extends TasksState {
  Failure error;
  GetAllTaskFailureState(this.error);
}
