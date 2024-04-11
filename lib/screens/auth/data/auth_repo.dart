import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/errors/failure.dart';
import 'package:task_manger/models/user_model.dart';

class authRepo {
  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    try {
      var data = await ApiService().post(
          endPoint: kLoginEndPount,
          body: {"email": email, "password": password});

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var data = await ApiService().post(endPoint: kRegestierEndPoint, body: {
        "email": email,
        "name": name,
        "password": password,
        "password_confirm": password
      });

      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
