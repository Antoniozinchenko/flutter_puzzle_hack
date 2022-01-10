import 'package:flutter/material.dart';

import 'board.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Board(gridSize: 4),
        ),
      ),
    );
  }
}
