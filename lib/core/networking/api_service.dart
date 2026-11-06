import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<dynamic> login(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.login, data: data);
    return response.data;
  }
}
