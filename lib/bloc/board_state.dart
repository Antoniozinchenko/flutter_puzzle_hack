import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class BoardState extends ChangeNotifier {
  BoardState({this.gridSize = 4}) {
    shuffle();
  }
  final int gridSize;
  final _timerSubject = BehaviorSubject<int>.seeded(0);

  StreamSubscription? _timerSubscription;
  Stream<int> get timer => _timerSubject.stream;
  List<int?> value = [];
  bool winner = false;
  int movesCount = 0;

  void shuffle() {

    value = [1,2,3,4,5,6,7,8,9,10,11,12,null, 13,14,15];
    // value = List.generate(gridSize * gridSize - 1, (index) => index + 1)
    //   ..shuffle()
    //   ..add(null);
    movesCount = 0;
    winner = false;
    notifyListeners();
  }

  void swap(int draggedIndex, int emptyIndex) {
    final result = [...value];
    result[emptyIndex] = result[draggedIndex];
    result[draggedIndex] = null;

    if (movesCount == 0) {
      _timerSubscription = Stream.periodic(const Duration(seconds: 1)).listen((event) {
        _timerSubject.add(_timerSubject.value + 1);
      });
    }
    value = result;
    movesCount++;
    if (_checkIfWinner()) {
      _timerSubject.add(0);
      _timerSubscription?.cancel();
      winner = true;
    }
    notifyListeners();
  }

  bool _checkIfWinner() {
    for (int i = 0; i < value.length - 1; i++) {
      if (value[i] != i + 1) {
        return false;
      }
    }
    return true;
  }

}
