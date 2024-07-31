import 'package:flutter_bloc/flutter_bloc.dart';
import '../Api/api_servies.dart';

class TaskStatistics {
  final bool isLoading;
  final int inProgress;
  final int finished;
  final int deadline;

  TaskStatistics({
    this.isLoading = false,
    required this.inProgress,
    required this.finished,
    required this.deadline,
  });
}


class StatisticsCubit extends Cubit<TaskStatistics> {
  final ApiService _apiService;

  StatisticsCubit(this._apiService) : super(TaskStatistics(isLoading: true, inProgress: 0, finished: 0, deadline: 0)) {
    fetchData();
  }

  void fetchData() async {
    emit(TaskStatistics(isLoading: true, inProgress: 0, finished: 0, deadline: 0));
    try {
      final inProgressResponse = await _apiService.get(endPoint: '/tasks/in-progress');
      final finishedResponse = await _apiService.get(endPoint: '/tasks/finished');
      final deadlineResponse = await _apiService.get(endPoint: '/tasks/deadline/3');

      final inProgressCount = (inProgressResponse['data'] as List).length;
      final finishedCount = (finishedResponse['data'] as List).length;
      final deadlineCount = (deadlineResponse['data'] as List).length;

      emit(TaskStatistics(
        isLoading: false,
        inProgress: inProgressCount,
        finished: finishedCount,
        deadline: deadlineCount,
      ));
    } catch (error) {
      print("Error fetching data: $error");
      emit(TaskStatistics(isLoading: false, inProgress: 0, finished: 0, deadline: 0));
    }
  }
}