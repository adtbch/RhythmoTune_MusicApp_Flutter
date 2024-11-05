// lib/funcbutton/skip_next_button.dart
import 'package:flutter/material.dart';

class SkipNextButton extends StatelessWidget {
  final VoidCallback onSkipNext;

  SkipNextButton({required this.onSkipNext});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.skip_next, color: Colors.white),
      onPressed: onSkipNext,
    );
  }
}
