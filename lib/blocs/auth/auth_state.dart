part of './auth_bloc.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoading extends AuthState {
  final bool loading;
  AuthLoading({required this.loading});
}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {}
