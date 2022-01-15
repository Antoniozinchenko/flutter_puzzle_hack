import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:puzzle_hack/bloc/winner_state.dart';
import 'package:puzzle_hack/widgets/tile/scale_animation.dart';
import 'reflection.dart';

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
    final color = winner ? Colors.green : Theme.of(context).primaryColor;
    final borderRadius = BorderRadius.circular(size * 0.1);
    return Container(
      padding: const EdgeInsets.all(2),
      width: size,
      height: size,
      child: ScaleAnimation(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                padding: EdgeInsets.all(size * 0.1),
                color: color,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white24,
                      ],
                    ),
                    borderRadius: borderRadius,
                  ),
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: size * 0.6,
                  color: Colors.white54,
                ),
              ),
              Reflection(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
