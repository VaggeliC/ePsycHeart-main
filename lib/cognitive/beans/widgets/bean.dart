import 'package:flutter/material.dart';

class Bean extends StatelessWidget {
  final Color color;
  final double size;

  const Bean({Key? key, required this.color, this.size = 48}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/bean.png',
      color: color,
      height: size,
      colorBlendMode: BlendMode.modulate,
    );
  }
}
