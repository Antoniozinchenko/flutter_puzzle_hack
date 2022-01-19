class BoardStateUtils {
  static bool isSolvable(List<int> tiles) {
    int inversionsCount = 0;
    for (int i = 0; i < tiles.length - 1; i++) {
      for (int j = i + 1; j < tiles.length; j++) {
        if (tiles[i] > tiles[j]) {
          inversionsCount++;
        }
      }
    }
    return inversionsCount.isEven;
  }

  static List<int?> shuffle(int gridSize) {
    /// generate all tiles (last tile - null will be added later in the end)
    final tiles = List.generate(gridSize * gridSize - 1, (i) => i + 1)
      ..shuffle();

    // shuffle until solvable state found
    if (isSolvable(tiles)) {
      return [...tiles, null];
    } else {
      return shuffle(gridSize);
    }
  }
}
