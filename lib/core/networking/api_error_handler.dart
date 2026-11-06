import 'package:dio/dio.dart';

import 'api_error_model.dart';

class ErrorHandler {
  final String message;
  final int? code;

  ErrorHandler({required this.message, this.code});

  factory ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ErrorHandler(message: "Connection timeout with API server");
        case DioExceptionType.badResponse:
          try {
            final apiErrorModel = ApiErrorModel.fromJson(error.response?.data);
            return ErrorHandler(
              message: apiErrorModel.message ?? "Received invalid status code",
              code: apiErrorModel.code,
            );
          } catch (_) {
            return ErrorHandler(
              message:
                  "Received invalid status code: ${error.response?.statusCode}",
              code: error.response?.statusCode,
            );
          }
        case DioExceptionType.cancel:
          return ErrorHandler(message: "Request to API server was cancelled");
        case DioExceptionType.connectionError:
          return ErrorHandler(message: "No internet connection");
        case DioExceptionType.unknown:
          return ErrorHandler(message: "Unexpected error occurred");
        default:
          return ErrorHandler(message: "Something went wrong");
      }
    } else {
      return ErrorHandler(message: error.toString());
    }
  }
}
