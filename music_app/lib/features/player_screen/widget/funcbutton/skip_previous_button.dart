// lib/funcbutton/skip_previous_button.dart
import 'package:flutter/material.dart';

class SkipPreviousButton extends StatelessWidget {
  final VoidCallback onSkipPrevious;

  SkipPreviousButton({required this.onSkipPrevious});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.skip_previous, color: Colors.white),
      onPressed: onSkipPrevious,
    );
  }
}
