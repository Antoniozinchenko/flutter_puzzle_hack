import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'board.dart';

class BoardDecoration extends StatelessWidget {
  const BoardDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final boardSize = constraints.maxWidth;
      return Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          const RiveAnimation.asset(
            'assets/rive/game_board.riv',
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.center,
            child: Board(boardSize: boardSize * 0.66),
          ),
        ],
      );
    });
  }
}
