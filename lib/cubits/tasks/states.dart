import 'package:task_manger/errors/failure.dart';

abstract class TasksState {}

class TaskInitialState extends TasksState {}

class DeleteTaskLoadingState extends TasksState {}

class DeleteTaskSuccessState extends TasksState {}

class DeleteTaskFailureState extends TasksState {
  Failure error;
  DeleteTaskFailureState(this.error);
}

class UpdateTaskLoadingState extends TasksState {}

class UpdateTaskSuccessState extends TasksState {}

class UpdateTaskFailureState extends TasksState {
  Failure error;
  UpdateTaskFailureState(this.error);
}