import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';

import 'score.dart';
import 'shuffle_butten.dart';

class GameStats extends StatelessWidget {
  const GameStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Score(),
          Builder(builder: (context) {
            final winner = context.watch<BoardState>().winner;
            if (winner) return const Text('YOU WIN!!!!!');
            return Container();
          }),
          const ShuffleButton(),
        ],
      ),
    );
  }
}
