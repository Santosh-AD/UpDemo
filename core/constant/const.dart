import 'dart:convert';

class Const {
  static String requestFailedNote = jsonEncode({"code": 2001, "detail": "Connection Unavailable"});
  static String requestBadNote = jsonEncode({"code": 2002, "detail": "Bad Request"});
  static String requestUnAuthorized = jsonEncode({"code": 2003, "detail": "Un Authorized"});
  static String requestSuccessNote = jsonEncode({"code": 2000, "detail": "Connection Success"});
}
