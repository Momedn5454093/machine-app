import '../../../core/networking/api_service.dart';
import '../../../core/networking/api_error_handler.dart';
import '../../../core/networking/api_result.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<dynamic>> login(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.login(data);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
