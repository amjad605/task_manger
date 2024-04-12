import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manger/cubits/tasks/states.dart';
import 'package:task_manger/screens/task_details_screen/data/task_repo.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TaskInitialState());

  static TasksCubit get(context) => BlocProvider.of(context);
  void deleteTask({required String? id}) async {
    emit(DeleteTaskLoadingState());
    var result = await TaskRepo().deleteTask(id: id);
    print(result);
    result.fold((l) {
      emit(DeleteTaskFailureState(l));
    }, (data) {
      emit(DeleteTaskSuccessState());
    });
  }
}
