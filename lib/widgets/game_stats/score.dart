import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';

class Score extends StatelessWidget {
  const Score({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final timer = context.watch<TimerState>();
    return Column(
      children: [
        Text(
          'Best Score: ${timer.bestScore ?? ""}',
          style: textTheme.headline5,
        ),
        Text(
          'Elapsed Time: ${timer.value ?? ""}',
          style: textTheme.headline5,
        ),
      ],
    );
  }
}
