part of './auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoggedIn extends AuthState {
  final User? credential;

  AuthLoggedIn({required this.credential});
}

class AuthLoggedOut extends AuthState {}

class AuthValidationError extends AuthState {
  final String errorMessage;
  AuthValidationError({required this.errorMessage});
}

class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}

class AuthLogout extends AuthState {}

class AuthEmailVerifying extends AuthState {}
