import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'stopwatch/stopwatch.dart';

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
          style: textTheme.headline4!.copyWith(color: Colors.white),
        ),
        const StopwatchWidget(),
      ],
    );
  }
}
