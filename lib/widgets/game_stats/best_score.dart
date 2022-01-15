import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'clock_view/clock_view.dart';

class BestScore extends StatelessWidget {
  const BestScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final score = context.watch<TimerState>().bestScore;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClockView(
          value: score,
          color: Colors.green.shade200,
        ),
        const SizedBox(width: 12),
        Text(
          'Best score',
          style: textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
