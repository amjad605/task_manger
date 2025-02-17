import '../../task_info.dart';

abstract class States {}

class LeftTasksState extends States {
  List<TaskData> leftTasks;
  LeftTasksState(this.leftTasks);
}

class DoneTasksState extends States {
  List<TaskData> finishedTasks;
  DoneTasksState(this.finishedTasks);
}

class FailedToGetTasksState extends States {
  String msg;
  FailedToGetTasksState(this.msg);
}

class LoadingState extends States {}
