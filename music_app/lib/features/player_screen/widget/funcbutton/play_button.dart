// lib/funcbutton/play_button.dart
import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onTogglePlayPause;

  PlayButton({required this.isPlaying, required this.onTogglePlayPause});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause : Icons.play_arrow,
        color: Colors.white,
        size: 30,
      ),
      onPressed: onTogglePlayPause,
    );
  }
}
