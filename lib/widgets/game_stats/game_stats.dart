import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

import 'score.dart';

class GameStats extends StatelessWidget {
  const GameStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Score(),
          Builder(builder: (context) {
            final winner = context.watch<WinnerState>().value;
            if (winner) {
              return Text(
                'WINNER!!!!!',
                style: textTheme.headline4,
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
