import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manger/Api/api_servies.dart';
import 'package:task_manger/Constants/constants.dart';
import 'package:task_manger/errors/failure.dart';

class ProfileRepo {
  Future<Either<Failure, Map<String, dynamic>>> getProfile() async {
    try {
      var data = await ApiService().get(endPoint: kProfileEndPoint);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> searchForFriend(
      String name) async {
    try {
      var data =
          await ApiService().post(endPoint: kSearchFriendEndPoint, body: {
        "name": name,
      });
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> addFriend(String id) async {
    try {
      var data =
          await ApiService().post(endPoint: "${kAddFriend + id}", body: {});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> getMyFriends() async {
    try {
      var data = await ApiService().get(endPoint: kMyFriends);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, Map<String, dynamic>>> getMyRequests() async {
    try {
      var data = await ApiService().get(endPoint: kGetFriendRequests);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, Map<String, dynamic>>> acceptRequest(String id) async {
    try {
      var data = await ApiService().patch(endPoint: kAcceptFriendRequests+id);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure, Map<String, dynamic>>> rejectRequest(String id) async {
    try {
      var data = await ApiService().patch(endPoint: kRejectFriendRequests+id);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
