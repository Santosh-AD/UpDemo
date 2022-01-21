import 'dart:io';

import 'package:up_demo_1/core/constant/const.dart';
import 'package:up_demo_1/data/model/args/login_credentials.dart';
import 'package:http/http.dart' as http show Response, get, post;
import 'package:up_demo_1/data/model/network/failed_request.dart';
import 'package:up_demo_1/data/network/base/base_network.dart';
import 'dart:developer' show log;

import 'package:up_demo_1/data/network/base/base_network_status.dart';

class AuthenticationApis {
  Future<ApiResult> getLoginData({required LoginCredentials credentials}) async {
    try {
      http.Response res = await http.post(
        BaseNetwork.getLoginUrl,
        body: credentials.toJson,
        headers: {
          'content-Type': 'application/json',
        },
      );
      if (res.statusCode == ApiStatusCode.SUCCESS) {
        log(res.body);
        return ApiResult(
          status: ApiStatus.success,
          response: requestFailedFromJson(Const.requestSuccessNote),
        );
      } else if (res.statusCode == ApiStatusCode.BADREQUEST) {
        return ApiResult(
          status: ApiStatus.badRequest,
          response: requestFailedFromJson(Const.requestBadNote),
        );
      } else if (res.statusCode == ApiStatusCode.UnAUTHORIZED) {
        return ApiResult(
          status: ApiStatus.unauthorized,
          response: requestFailedFromJson(Const.requestUnAuthorized),
        );
      } else {
        return ApiResult(
          status: ApiStatus.failed,
          response: requestFailedFromJson(Const.requestFailedNote),
        );
      }
    } on SocketException {
      return ApiResult(
        status: ApiStatus.failed,
        response: requestFailedFromJson(Const.requestFailedNote),
      );
    }
  }
}
