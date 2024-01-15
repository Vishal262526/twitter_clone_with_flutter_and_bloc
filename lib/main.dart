import 'package:flutter/material.dart';
import 'package:twitter_clone_with_bloc/presentation/auth/login_screen.dart';
import 'package:twitter_clone_with_bloc/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
