part of './auth_bloc.dart';

abstract class AuthEvent {}

class AuthLoginRequested extends AuthEvent {}

class AuthSignupRequested extends AuthEvent {}
