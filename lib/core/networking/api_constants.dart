class ApiConstants {
  static const String apiBaseUrl =
      "https://api.example.com/"; // TODO: Update with your backend URL
  static const String login = "api/auth/login/";
  static const String customers = "api/customers/";
  static const String importCustomers = "api/imports/customers/";
  static const String campaigns = "api/campaigns/";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String unauthorized = "unauthorized";
  static const String forbidden = "forbidden";
  static const String notFound = "notFound";
  static const String internalServerError = "internalServerError";
  static const String connectionTimeout = "connectionTimeout";
  static const String receiveTimeout = "receiveTimeout";
  static const String unknownError = "unknownError";
}
