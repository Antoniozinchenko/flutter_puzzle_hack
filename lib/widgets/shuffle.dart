import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

class Shuffle extends StatelessWidget {
  const Shuffle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardState = context.read<BoardState>();
    final winnerState = context.read<WinnerState>();

    return IconButton(
      onPressed: () {
        winnerState.reset();
        boardState.shuffle();
      },
      icon: const Icon(Icons.replay),
    );
  }
}
