import 'package:flutter/material.dart';
import 'package:puzzle_hack/widgets/game_stats/score.dart';
import 'package:rive/rive.dart';

import 'board.dart';

class BoardLayout extends StatelessWidget {
  const BoardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: LayoutBuilder(builder: (context, constraints) {
        final boardSize = constraints.maxWidth;
        return Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: boardSize,
                width: boardSize,
                child: OverflowBox(
                  maxHeight: boardSize * 1.2,
                  maxWidth: boardSize * 1.2,
                  child:
                      const RiveAnimation.asset('assets/rive/game_board.riv'),
                ),
              ),
            ),
            Positioned(
              bottom: boardSize * 0.1,
              child: Board(boardSize: boardSize * 0.8),
            ),
            Positioned(
              bottom: boardSize * 0.98,
              child: const Score(),
            ),
          ],
        );
      }),
    );
  }
}
