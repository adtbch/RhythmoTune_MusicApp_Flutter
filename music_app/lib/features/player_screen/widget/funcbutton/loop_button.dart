// lib/funcbutton/loop_button.dart
import 'package:flutter/material.dart';

class LoopButton extends StatelessWidget {
  final VoidCallback onLoop;
  final bool isLooping;

  LoopButton({required this.onLoop, this.isLooping = false});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.loop,
        color: isLooping ? Colors.blue : Colors.white,
      ),
      onPressed: onLoop,
    );
  }
}
