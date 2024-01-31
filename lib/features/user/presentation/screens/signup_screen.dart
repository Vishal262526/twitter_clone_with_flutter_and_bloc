import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter_clone_with_bloc/common/rounded_small_button.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/bloc/auth_bloc.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/screens/verification_screen.dart';
import 'package:twitter_clone_with_bloc/features/user/presentation/widgets/auth_field.dart';
import 'package:twitter_clone_with_bloc/features/core/theme/pallate.dart';
import 'package:twitter_clone_with_bloc/utils/routes.dart';

class SignupScreen extends StatefulWidget {
  static route() => Routes.pageRoute(const SignupScreen());
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    print("Sign up Page is Dispose .......");
    super.dispose();
  }

  void onSignup() {
    context.read<AuthBloc>().add(
          AuthSignupRequested(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.white,
                content: Text(
                  state.errorMessage,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Pallate.kBackgroundColor,
                  ),
                ),
              ),
            );
          } else if (state is AuthEmailVerifying) {
            // Navigator.push(context, VerificationScreen.route());
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Pallate.kBlueColor,
              ),
            );
          }
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text Field 1
                    AuthField(
                      controller: _nameController,
                      placeholder: "Full Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      height: 20,
                    ),
                    if (state is AuthValidationError)
                      Text(
                        state.errorMessage,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(
                      height: 32,
                    ),
                    // Done Button
                    Align(
                      alignment: Alignment.centerRight,
                      child: RoundedSmallButton(
                        label: "Done",
                        onTap: onSignup,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    // Text Span
                    RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(fontSize: 16),
                        children: [
                          TextSpan(
                            text: "Log In",
                            style: const TextStyle(
                              color: Pallate.kBlueColor,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.read<AuthBloc>().add(AuthSetInitial());
                                Navigator.pop(context);
                              },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
