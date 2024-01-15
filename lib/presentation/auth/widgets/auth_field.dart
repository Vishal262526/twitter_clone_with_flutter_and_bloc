import 'package:flutter/material.dart';
import 'package:twitter_clone_with_bloc/theme/pallate.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final bool secureEntry;
  final String placeholder;
  const AuthField({
    super.key,
    required this.controller,
    this.secureEntry = false,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureEntry,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Pallate.kGreyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Pallate.kBlueColor,
            width: 3,
          ),
        ),
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.all(15.0),
      ),
    );
  }
}
