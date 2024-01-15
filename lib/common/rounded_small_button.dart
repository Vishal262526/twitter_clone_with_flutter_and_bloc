import 'package:flutter/material.dart';
import 'package:twitter_clone_with_bloc/theme/pallate.dart';

class RoundedSmallButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final VoidCallback onTap;

  const RoundedSmallButton({
    super.key,
    required this.label,
    this.backgroundColor = Pallate.kWhiteColor,
    this.labelColor = Pallate.kBackgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: labelColor,
            fontSize: 16,
          ),
        ),
        backgroundColor: backgroundColor,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      ),
    );
  }
}
