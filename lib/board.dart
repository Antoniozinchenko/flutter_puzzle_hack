import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/board_state.dart';
import 'drag_direction.dart';
import 'widgets/tile/tile.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardState = context.watch<BoardState>();
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue.shade100,
      child: LayoutBuilder(builder: (context, constraints) {
        final boardSize = constraints.maxWidth;
        return Stack(children: _buildItems(boardState, boardSize));
      }),
    );
  }

  List<Widget> _buildItems(BoardState boardState, double boardSize) {
    final size = boardSize / boardState.gridSize;
    final items = <Widget>[];
    for (int i = 0; i < boardState.value.length; i++) {
      if (boardState.value.elementAt(i) != null) {
        DragDirection? dragDirection;
        Function()? onSwap;
        // check item on right side
        if (((i + 1) % boardState.gridSize > 0) && boardState.value[i + 1] == null) {
          dragDirection = DragDirection.right;
          onSwap = () => boardState.swap(i, i + 1);
          
          // check item on left side
        } else if ((i % boardState.gridSize != 0) && boardState.value[i - 1] == null) {
          dragDirection = DragDirection.left;
          onSwap = () => boardState.swap(i, i - 1);

          // check item above
        } else if (i >= boardState.gridSize &&
            boardState.value[i - boardState.gridSize] == null) {
          dragDirection = DragDirection.up;
          onSwap = () => boardState.swap(i, i - boardState.gridSize);

          // check item below
        } else if (i < boardState.value.length - boardState.gridSize &&
            boardState.value[i + boardState.gridSize] == null) {
          dragDirection = DragDirection.down;
          onSwap = () => boardState.swap(i, i + boardState.gridSize);
        }

        items.add(Tile(
          key: ValueKey(i),
          top: i ~/ boardState.gridSize * size,
          left: i % boardState.gridSize * size,
          size: size,
          value: boardState.value[i]!,
          valid: boardState.value[i] == i + 1,
          dragDirection: dragDirection,
          onSwap: onSwap,
        ));
      }
    }
    return items;
  }
}
