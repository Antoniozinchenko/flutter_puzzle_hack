import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';

import 'score_timer.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardState = context.watch<BoardState>();
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          'Moves: ${boardState.movesCount}',
          style: textTheme.headline4,
        ),
        const ScoreTimer(),
      ],
    );
  }
}
