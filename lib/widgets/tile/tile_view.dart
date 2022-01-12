import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

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
    final winner = context.watch<WinnerState>().value;
    final color = winner ? Colors.green.shade400 : Colors.blue.shade400;
    return Container(
      padding: const EdgeInsets.all(2),
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          color: color,
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
