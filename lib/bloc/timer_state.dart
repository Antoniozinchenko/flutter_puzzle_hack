import 'dart:async';

import 'package:flutter/material.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

class TimerState extends ValueNotifier<int?> {
  TimerState() : super(null);

  int? bestScore;

  StreamSubscription? _subscription;

  void checkTimer(WinnerState winnerState) {
    if (winnerState.value) {
      bestScore = bestScore == null || value! < bestScore! ? value : bestScore;
      _subscription?.cancel();
      notifyListeners();
    } else if (winnerState.movesCount < 1) {
      _subscription?.cancel();
      value = null;
    } else if (winnerState.movesCount == 1) {
      value = 0;
      _subscription = Stream.periodic(const Duration(seconds: 1))
          .listen((_) => value = value! + 1);
    }
  }
}
