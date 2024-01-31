import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/bloc/auth_bloc.dart';
import 'package:twitter_clone_with_bloc/firebase_options.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/screens/login_screen.dart';
import 'package:twitter_clone_with_bloc/features/core/theme/app_theme.dart';
import 'package:twitter_clone_with_bloc/features/core/theme/pallate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(firebaseAuth: FirebaseAuth.instance),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Pallate.kBlueColor,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                if (snapshot.data!.emailVerified) {
                  return Container();
                } else {
                  context
                      .read<AuthBloc>()
                      .add(AuthSentVerificationEmailEvent());
                  return const VerificationScreen();
                }
              } else {
                return const LoginScreen();
              }
            } else {
              return const Scaffold(
                body: Center(
                  child: Text("Error is Occured"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
