import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'clock_view/clock_view.dart';

class BestScore extends StatelessWidget {
  const BestScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final score = context.watch<TimerState>().bestScore;
    return ClockView(
      value: score,
      color: Colors.green.shade200,
    );
  }
}
