part of './auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

class AuthSignupRequested extends AuthEvent {
  final String email;
  final String password;

  AuthSignupRequested({required this.email, required this.password});
}

class AuthLogoutRequested extends AuthEvent {}

class AuthStatusCheck extends AuthEvent {}

class AuthSetInitial extends AuthEvent {}

class AuthSentVerificationEmailEvent extends AuthEvent {}
