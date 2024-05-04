import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repo/get_tasks_repo.dart';
import '../../task_info.dart';
import 'tasks_states.dart';

class SwitchDoneLeftTasks extends Cubit<States> {
  SwitchDoneLeftTasks() : super(DoneTasksState([]));

  static SwitchDoneLeftTasks get(context) => BlocProvider.of(context);

  void switched(int index) async {
    if (index == 1) {
      var tasks = await GetTasksRepo().getDoneTasks();

      tasks.fold((failure) => emit(FailedToGetTasksState(failure.errmsg)),
          (donetasks) => emit(DoneTasksState(donetasks)));
    } else {
      var tasks = await GetTasksRepo().getInProgressTasks();
      tasks.fold((failure) => emit(FailedToGetTasksState(failure.errmsg)),
          (inProgresstasks) => emit(LeftTasksState(inProgresstasks)));
    }
  }
}
