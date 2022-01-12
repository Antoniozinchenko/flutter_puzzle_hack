import 'package:flutter/material.dart';
import 'package:puzzle_hack/bloc/board_state.dart';

class WinnerState extends ValueNotifier<bool> {
  WinnerState() : super(false);

  int movesCount = -1;

  void reset() {
    movesCount = -1;
    notifyListeners();
  }

  void check(BoardState board) {
    movesCount++;
    bool result = true;
    for (int i = 0; i < board.value.length - 1; i++) {
      if (board.value[i] != i + 1) {
        result = false;
      }
    }
    value = result;
    notifyListeners();
  }
}
