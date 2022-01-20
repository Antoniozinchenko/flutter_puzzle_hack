import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/timer_state.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';
import 'package:puzzle_hack/widgets/board_layout.dart';

import 'bloc/board_state.dart';

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
            child: const Center(
              child: BoardLayout(),
            ),
          ),
        ),
      ),
    );
  }
}
