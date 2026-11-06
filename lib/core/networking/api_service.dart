import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Example method stubs matching your endpoints
  Future<dynamic> login(Map<String, dynamic> data) async {
    final response = await _dio.post(ApiConstants.login, data: data);
    return response.data;
  }

  Future<dynamic> getCustomers() async {
    final response = await _dio.get(ApiConstants.customers);
    return response.data;
  }

  Future<dynamic> importCustomers(FormData formData) async {
    final response = await _dio.post(
      ApiConstants.importCustomers,
      data: formData,
    );
    return response.data;
  }
}
