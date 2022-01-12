import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boardState = context.read<BoardState>();

    return ElevatedButton(
      onPressed: boardState.shuffle,
      child: const Text('Shuffle'),
    );
  }
}
