import 'package:flutter/material.dart';

class Reflection extends StatelessWidget {
  const Reflection({Key? key, required this.size}) : super(key: key);

  final double size;

  static const reflectionSize = 0.5;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      tween: Tween<double>(
        begin: -size * reflectionSize,
        end: size,
      ),
      builder: (context, value, child) {
        return Positioned(
          top: 0,
          left: value,
          child: child!,
        );
      },
      child: Container(
        height: size,
        width: size * reflectionSize,
        color: Colors.white30,
      ),
    );
  }
}
