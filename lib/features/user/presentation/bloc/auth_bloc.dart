import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part './auth_event.dart';
part './auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;
  AuthBloc({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth,
        super(AuthInitial()) {
    on<AuthSetInitial>(setInitialStat);
    on<AuthLoginRequested>(login);
    on<AuthSignupRequested>(signup);
    on<AuthLogoutRequested>(logout);
    on<AuthSentVerificationEmailEvent>(sentVerificationEmail);
  }

  void sentVerificationEmail(event, emit) async {
    final bool isEmailVerified = _firebaseAuth.currentUser!.emailVerified;
    if (isEmailVerified) {
      emit(
        AuthLoggedIn(credential: _firebaseAuth.currentUser),
      );
      return;
    }

    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
      emit(AuthEmailVerifying());
    } catch (e) {
      emit(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
    return;
  }

  void setInitialStat(event, emit) {
    emit(AuthInitial());
  }

  // Trigger on AuthLoginRequested Event
  void login(event, emit) async {
    emit(AuthLoading());

    if (event.email == "" || event.password == "") {
      print("Validation Error is Called");
      emit(AuthValidationError(errorMessage: "All Fields are Required"));
      return;
    }
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      add(AuthSentVerificationEmailEvent());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errorMessage: e.message ?? "Error Occured"));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  // Trigger on AuthSignupRequested Event
  void signup(event, emit) async {
    emit(AuthLoading());

    if (event.email == "" || event.password == "") {
      print("Validation Error is Called");
      emit(AuthValidationError(errorMessage: "All Fields are Required"));
      return;
    }

    try {
      final UserCredential credential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);

      add(AuthSentVerificationEmailEvent());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(errorMessage: e.message ?? "Error Occured"));
    } catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  void logout(event, emit) async {
    try {
      await _firebaseAuth.signOut();
      emit(AuthLoggedOut());
    } catch (e) {}
  }

  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    print("Changes is Auth : $change");
    super.onChange(change);
  }
}
