import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/board_state.dart';

class ScoreTimer extends StatelessWidget {
  const ScoreTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return StreamBuilder<int>(
        stream: context.read<BoardState>().timer,
        builder: (context, snapshot) {
          return Text(
            'Elapsed Time: ${snapshot.data}',
            style: textTheme.headline5,
          );
        });
  }
}
