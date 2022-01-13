import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';
import 'package:puzzle_hack/widgets/game_stats/game_stats.dart';
import 'package:puzzle_hack/widgets/shuffle.dart';

import 'bloc/board_state.dart';
import 'board.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BoardState>(
          create: (_) => BoardState(gridSize: 4),
        ),
        ChangeNotifierProvider<WinnerState>(
          create: (_) => WinnerState(),
        ),
        ChangeNotifierProxyProvider<WinnerState, TimerState>(
          create: (_) => TimerState(),
          update: (_, winnerState, timer) => timer!..checkTimer(winnerState),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: const [Shuffle()],
        ),
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
