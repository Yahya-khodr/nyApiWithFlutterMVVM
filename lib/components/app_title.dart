import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String text;
  final double size;

  const AppTitle({
    Key? key,
    required this.text,
    this.size = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
