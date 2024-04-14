import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/errors/failure.dart';

import '../../../cache_helper/local.dart';
import '../task_info.dart';

class GetTasksRepo {
  Future<Either<Failure, List<TaskData>>> getInProgressTasks() async {
    try {
      var result = await ApiService().get(
        endPoint: "$kTasksEndPoint$kInProgressEndPoint",
      );
      List<dynamic> tasksMap = result["data"];
      List<TaskData> tasks = [];
      for (var task in tasksMap) {
        tasks.add(TaskData.fromJson(task));
      }
      return right(tasks);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }

  Future<Either<Failure, List<TaskData>>> getDoneTasks() async {
    try {
      var result = await ApiService().get(
        endPoint: "$kTasksEndPoint$kDoneEndPoint",
      );
      List<dynamic> tasksMap = result["data"];
      List<TaskData> tasks = [];
      for (var task in tasksMap) {
        tasks.add(TaskData.fromJson(task));
      }
      return right(tasks);
    } on ServerFailure catch (failure) {
      return Left(failure);
    }
  }
}
