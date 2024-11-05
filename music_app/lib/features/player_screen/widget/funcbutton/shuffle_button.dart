// lib/funcbutton/shuffle_button.dart
import 'package:flutter/material.dart';

class ShuffleButton extends StatelessWidget {
  final VoidCallback onShuffle;

  ShuffleButton({required this.onShuffle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.shuffle, color: Colors.white),
      onPressed: onShuffle,
    );
  }
}
