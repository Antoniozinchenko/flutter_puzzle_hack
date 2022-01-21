import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardState = context.read<BoardState>();
    final winnerState = context.read<WinnerState>();

    return GestureDetector(
      onTap: () {
        winnerState.reset();
        boardState.shuffle();
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF343434),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          Icons.replay,
          size: 40,
          color: Colors.red.shade300,
        ),
      ),
    );
  }
}
