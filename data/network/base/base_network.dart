import 'package:flutter/foundation.dart';

class BaseNetwork {
  BaseNetwork._();
  static const String _BASE_URL_DEBUG = "https://demo.hyeconnect.am";
  static const String _BASE_URL_PROD = "https://demo.hyeconnect.am";
  static const String _BASE_URL = kDebugMode ? _BASE_URL_DEBUG : _BASE_URL_PROD;

  static get getLoginUrl => Uri.parse(_BASE_URL + "/api/auth/api/v1/auth/sign-in");
}
