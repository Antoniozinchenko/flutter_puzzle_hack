import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/widgets/game_stats/game_stats.dart';

import 'bloc/board_state.dart';
import 'board.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BoardState(gridSize: 4),
        ),
      ],
      child: Scaffold(
        body: Column(
          children: const [
            GameStats(),
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Board(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
