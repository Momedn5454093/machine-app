class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['message'] ?? json['detail'] ?? 'Unknown error occurred',
      code: json['code'],
    );
  }
}
