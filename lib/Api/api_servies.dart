import 'package:dio/dio.dart';

class ApiService {
  static final _baseUrl = 'https://cxmanager.onrender.com/';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$endPoint');
    return response.data;
  }

  Future<Response> post({required String endPoint, required body}) async {
    var response = await _dio.post(endPoint, data: body);
    return response;
  }
}
