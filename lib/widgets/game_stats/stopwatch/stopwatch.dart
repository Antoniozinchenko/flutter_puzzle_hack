import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'package:puzzle_hack/widgets/game_stats/stopwatch/digit_pair.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final value = context.watch<TimerState>().value;

    if (value == null) {
      return Text(
        'Make move to start..',
        style: textTheme.headline4!.copyWith(color: Colors.white),
      );
    }

    final int seconds = value % 60;
    final int minutes = value ~/ 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DigitPair(value: minutes),
        const Text(
          ':',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 30,
          ),
        ),
        DigitPair(value: seconds)
      ],
    );
  }
}
