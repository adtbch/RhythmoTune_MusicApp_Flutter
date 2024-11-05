import 'package:flutter/material.dart';

class AvatarComponent extends StatelessWidget {
  final String imagePath;
  final double radius;

  const AvatarComponent({
    required this.imagePath,
    this.radius = 18,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
