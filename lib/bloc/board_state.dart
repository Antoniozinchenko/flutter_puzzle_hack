import 'package:flutter/material.dart';

class BoardState extends ValueNotifier<List<int?>> {
  BoardState({this.gridSize = 4}) : super([]) {
    shuffle();
  }
  final int gridSize;

  void shuffle() {
    value = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, null, 13, 14, 15];
    // value = List.generate(gridSize * gridSize - 1, (index) => index + 1)
    //   ..shuffle()
    //   ..add(null);
  }

  void swap(int draggedIndex, int emptyIndex) {
    final result = [...value];
    result[emptyIndex] = result[draggedIndex];
    result[draggedIndex] = null;
    value = result;
  }
}
