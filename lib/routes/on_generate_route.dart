import 'package:flutter/material.dart';
import 'package:twitter_clone_with_bloc/features/core/const/page_const.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/screens/login_screen.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/screens/signup_screen.dart';

class OnGenerateRoutes {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.loginPage:
        {
          return materialPageBuilder(const LoginScreen());
        }
      case PageConst.signupPage:
        {
          return materialPageBuilder(const SignupScreen());
        }
    }
  }
}

dynamic materialPageBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
