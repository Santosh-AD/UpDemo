part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationStateLoading extends AuthenticationState {}

class AuthenticationStateSuccess extends AuthenticationState {}

class AuthenticationStateFailed extends AuthenticationState {}

class AuthenticationStateUnAuthorized extends AuthenticationState {}
