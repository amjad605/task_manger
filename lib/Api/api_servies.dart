import 'package:dio/dio.dart';
import 'package:task_manger/Constants/constants.dart';

import '../Constants/constants.dart';
import '../cache_helper/local.dart';

class ApiService {
  static const _baseUrl = 'https://cxmanager.onrender.com';
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  static void initialize(String token) {
    _dio.options.headers = {'Authorization': 'Bearer $token'};
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required body}) async {
    var response = await _dio.post(endPoint, data: body);
    return response.data;
  }

  Future<void> delete({required String endPoint}) async {
    var response = await _dio.delete(endPoint);
    print(response);
  }
}
