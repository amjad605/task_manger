import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/errors/failure.dart';
import 'package:task_manger/models/task_model.dart';

class TaskRepo {
  Future<Either<Failure, Unit>> deleteTask({required String? id}) async {
    try {
      print(id);
      await ApiService().delete(
        endPoint: "$kTasksEndPount/$id",
      );
      return right(unit);
    } catch (e) {
      print(e);
      if (e is DioException) {
        if (e.response?.statusCode == 204) {
          print('here2');
          return right(unit);
        } else {
          return left(ServerFailure.fromDioError(e));
        }
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
