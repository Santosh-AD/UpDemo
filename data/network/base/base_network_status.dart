// ignore_for_file: constant_identifier_names

class ApiResult<T> {
  final ApiStatus status;
  final T response;

  ApiResult({required this.status, required this.response});
  T get getResponse => response;

  ApiStatus get getStatus => status;
}

enum ApiStatus { success, failed, unauthorized, forbid, badRequest, relogin }

class ApiStatusCode {
  static const int SUCCESS = 200;
  static const int FORBID = 403;
  static const int UnAUTHORIZED = 401;
  static const int BADREQUEST = 400;
  static const int FAILED = 3000;
  static const int TIMEOUT = 2029;
  static const int InvalidLogin = 501;
}
