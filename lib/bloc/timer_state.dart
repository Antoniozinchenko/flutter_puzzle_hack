import 'dart:async';

import 'package:flutter/material.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerState extends ValueNotifier<int?> {
  TimerState() : super(null) {
    SharedPreferences.getInstance().then((prefs) {
      bestScore = prefs.getInt(bestScoreKey);
      notifyListeners();
    });
  }

  static const bestScoreKey = 'best';

  int? bestScore;

  StreamSubscription? _subscription;

  Future<void> _saveScore() async {
      if (bestScore != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt(bestScoreKey, bestScore!);
      }
  }

  Future<void> checkTimer(WinnerState winnerState) async {
    if (winnerState.value) {
      bestScore = bestScore == null || value! < bestScore! ? value : bestScore;
      _subscription?.cancel();
      notifyListeners();
      _saveScore();
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
