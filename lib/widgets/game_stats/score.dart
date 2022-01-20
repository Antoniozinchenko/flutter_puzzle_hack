import 'package:flutter/material.dart';
import 'package:puzzle_hack/widgets/game_stats/shuffle_button.dart';

import 'best_score.dart';
import 'stopwatch.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        BestScore(),
        SizedBox(width: 12),
        StopwatchWidget(),
        SizedBox(width: 12),
        ShuffleButton()
      ],
    );
  }
}
