import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  final double iconSize;
  const AppIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon),
        iconSize: iconSize,
        onPressed: () {
          onPressed;
        });
  }
}
