import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';
import 'package:puzzle_hack/widgets/game_stats/score.dart';
import 'package:puzzle_hack/widgets/shuffle_button.dart';

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
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black,
                    Color(0xFF434343),
                  ]),
            ),
            child: Column(
              children: const [
                Score(),
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Board(),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ShuffleButton(),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
