import 'dart:convert';

class LoginCredentials {
  final String email;
  final String password;
  final String fto;
  final String hex;
  const LoginCredentials({
    required this.email,
    required this.fto,
    required this.hex,
    required this.password,
  });
  String get toJson => jsonEncode({
        'email': email,
        'password': password,
        'fto': fto,
        'hex': hex,
        'newUser': true,
      });
}
