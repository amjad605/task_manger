import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task_manger/errors/failure.dart';
import 'package:task_manger/screens/task_details_screen/data/task_repo.dart';

part 'update_state.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInitial());

  Future<void> updateTask(
      {required String taskId, required Map<String, dynamic> taskData}) async {
    emit(UpdateTaskLoadingState());
    var result = await TaskRepo().updateTask(id: taskId, data: taskData);
    result.fold((l) {
      emit(UpdateTaskFailureState(l));
    }, (data) {
      emit(UpdateTaskSuccessState());
    });
  }
}
