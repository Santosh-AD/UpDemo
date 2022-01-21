import 'dart:io';

import 'package:up_demo_1/data/model/args/login_credentials.dart';
import 'package:up_demo_1/data/network/authentication_apis.dart';
import 'package:up_demo_1/data/network/base/base_network_status.dart';
import 'package:up_demo_1/data/network/base/encryption_service%20.dart';
import 'package:up_demo_1/data/network/base/https_overrides.dart';

class AuthenticationRepo {
  late final AuthenticationApis _apis;
  AuthenticationRepo({required AuthenticationApis apis}) {
    _apis = apis;
  }

  checkLogin() {
    //Check SharedPreference and token validity and return true false accordingly
  }

  Future<ApiResult> fetchLogin({required email, required password}) async {
    ///This is used to dodge handshake verification error
    ///must not be used in production `Danger`
    HttpOverrides.global = HttpsOverrides();

    final encryptionService = EncryptionService.shared;
    encryptionService.config(
      plainEmail: email,
      plainPassword: password,
    );

    final String encryptedPassword = encryptionService.getEncryptedBase64Password();
    final String bcryptedPassword = encryptionService.getBcryptedPassword();
    final String iv = encryptionService.getBase16IV();

    LoginCredentials _credentials = LoginCredentials(
      email: email,
      password: encryptedPassword,
      fto: bcryptedPassword,
      hex: iv,
    );
    ApiResult result = await _apis.getLoginData(credentials: _credentials);
    //you can use the result to store the login information
    // store data in data cache
    // finetune response
    return result;
  }
}
