import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';

import 'clock_view/clock_view.dart';

class StopwatchWidget extends StatelessWidget {
  const StopwatchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<TimerState>().value;

    return ClockView(
      value: value,
      color: Colors.yellow.shade200,
    );
  }
}
