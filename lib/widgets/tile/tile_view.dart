import 'package:flutter/material.dart';

class TileView extends StatelessWidget {
  const TileView({
    Key? key,
    required this.value,
    required this.size,
    required this.valid,
  }) : super(key: key);

  final int value;
  final double size;
  final bool valid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade400,
          borderRadius: BorderRadius.circular(size * 0.1),
        ),
        child: Center(
          child: Text(
            value.toString(),
            style: TextStyle(
              fontSize: size * 0.6,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}
