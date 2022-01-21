part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventCheckLogin extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationEventFetchLogin extends AuthenticationEvent {
  final String email;
  final String password;
  const AuthenticationEventFetchLogin({required this.email, required this.password});
}
