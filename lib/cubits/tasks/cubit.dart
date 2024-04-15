import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/cubits/tasks/states.dart';
import 'package:task_manger/models/task_model.dart';
import 'package:task_manger/screens/task_details_screen/data/task_repo.dart';

import '../../screens/add_task_screen/models/task.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TaskInitialState());
  late TaskModel tasks;
  static TasksCubit get(context) => BlocProvider.of(context);
  void deleteTask({required String? id}) async {
    emit(DeleteTaskLoadingState());
    var result = await TaskRepo().deleteTask(id: id);
    print(result);
    result.fold((l) {
      emit(DeleteTaskFailureState(l));
    }, (data) {
      emit(DeleteTaskSuccessState());
      getAllTasks();
    });
  }

  void getAllTasks() async {
    emit(DeleteTaskLoadingState());
    var result = await TaskRepo().getAllTasks();

    result.fold((l) {
      emit(DeleteTaskFailureState(l));
    }, (data) {
      tasks = TaskModel.fromJson(data);
      emit(DeleteTaskSuccessState());
    });
  }
}
