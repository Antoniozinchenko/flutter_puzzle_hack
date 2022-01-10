import 'package:flutter/material.dart';
import 'package:puzzle_hack/drag_direction.dart';
import 'package:puzzle_hack/item.dart';

class Board extends StatefulWidget {
  const Board({
    Key? key,
    required this.gridSize,
  }) : super(key: key);

  final int gridSize;

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<int?> boardState = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant Board oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.gridSize != widget.gridSize) {
      _init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final boardSize = constraints.maxWidth;
      return Stack(
        children: [
          Container(
            color: Colors.blue.shade100,
          ),
          ..._buildItems(boardSize),
        ],
      );
    });
  }

  void _init() {
    setState(() {
      boardState = List.generate(
          widget.gridSize * widget.gridSize - 1, (index) => index + 1)
        ..shuffle()
        ..add(null);
    });
  }

  List<Widget> _buildItems(double boardSize) {
    final size = boardSize / widget.gridSize;
    final items = <Widget>[];
    for (int i = 0; i < boardState.length; i++) {
      if (boardState.elementAt(i) != null) {
        DragDirection? dragDirection;
        Function()? onSwap;
        // check item on right side
        if (((i + 1) % widget.gridSize > 0) && boardState[i + 1] == null) {
          dragDirection = DragDirection.right;
          onSwap = () => setState(() {
                final result = [...boardState];
                result[i + 1] = result[i];
                result[i] = null;
                boardState = result;
              });
          // check item on left side
        } else if ((i % widget.gridSize != 0) && boardState[i - 1] == null) {
          dragDirection = DragDirection.left;
          onSwap = () => setState(() {
                boardState[i - 1] = boardState[i];
                boardState[i] = null;
              });
          // check item above
        } else if (i >= widget.gridSize &&
            boardState[i - widget.gridSize] == null) {
          dragDirection = DragDirection.up;
          onSwap = () => setState(() {
                boardState[i - widget.gridSize] = boardState[i];
                boardState[i] = null;
              });
          // check item below
        } else if (i < boardState.length - widget.gridSize &&
            boardState[i + widget.gridSize] == null) {
          dragDirection = DragDirection.down;
          onSwap = () => setState(() {
                boardState[i + widget.gridSize] = boardState[i];
                boardState[i] = null;
              });
        }

        items.add(Item(
          key: ValueKey(i),
          top: i ~/ widget.gridSize * size,
          left: i % widget.gridSize * size,
          size: size,
          value: boardState[i]!,
          dragDirection: dragDirection,
          onSwap: onSwap,
        ));
      }
    }
    return items;
  }
}
