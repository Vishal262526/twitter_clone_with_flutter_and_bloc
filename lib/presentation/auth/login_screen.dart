import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_with_bloc/common/rounded_small_button.dart';
import 'package:twitter_clone_with_bloc/presentation/auth/signup_screen.dart';
import 'package:twitter_clone_with_bloc/presentation/auth/widgets/auth_field.dart';
import 'package:twitter_clone_with_bloc/theme/pallate.dart';
import 'package:twitter_clone_with_bloc/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  static route() => Routes.pageRoute(const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    // TODO: implement initState
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Field 1
                AuthField(
                  controller: _emailController,
                  placeholder: "Email Address",
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text Field 2
                AuthField(
                  controller: _passwordController,
                  placeholder: "Password",
                  secureEntry: true,
                ),
                const SizedBox(
                  height: 32,
                ),
                // Done Button
                Align(
                  alignment: Alignment.centerRight,
                  child: RoundedSmallButton(
                    label: "Done",
                    onTap: onLogin,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),

                // Text Span
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: "Sign Up",
                        style: const TextStyle(
                          color: Pallate.kBlueColor,
                          fontSize: 16,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SignupScreen.route(),
                            );
                          },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
