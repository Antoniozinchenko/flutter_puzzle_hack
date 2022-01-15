import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';

import 'clock_view/clock_view.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final value = context.watch<TimerState>().value;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClockView(
          value: value,
          color: Colors.yellow.shade200,
        ),
        const SizedBox(width: 12),
        Text(
          'Elapsed Time',
          style: textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
