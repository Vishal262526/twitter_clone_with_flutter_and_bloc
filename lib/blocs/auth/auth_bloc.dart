import 'package:flutter_bloc/flutter_bloc.dart';
part './auth_event.dart';
part './auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState()) {
    on<AuthLoginRequested>(login);
    on<AuthSignupRequested>(signup);
  }

  // Trigger on AuthLoginRequested Event
  void login(event, emit) {}

  // Trigger on AuthSignupRequested Event
  void signup(event, emit) {}
}
