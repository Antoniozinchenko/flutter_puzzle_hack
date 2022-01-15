import 'package:flutter/material.dart';

import 'best_score.dart';
import 'stopwatch.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          BestScore(),
          SizedBox(height: 12),
          StopwatchWidget(),
        ],
      ),
    );
  }
}
