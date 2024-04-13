import 'package:dio/dio.dart';

import '../Constants/constants.dart';
import '../cache_helper/local.dart';

class ApiService {
  static const _baseUrl = 'https://cxmanager.onrender.com';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: kAccessToken)}',
      },
    ),
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$endPoint');
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required body}) async {
    var response = await _dio.post(endPoint, data: body);
    return response.data;
  }
}
