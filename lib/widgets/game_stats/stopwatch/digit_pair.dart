import 'package:flutter/material.dart';
import 'package:puzzle_hack/widgets/game_stats/stopwatch/digit.dart';

class DigitPair extends StatelessWidget {
  const DigitPair({Key? key, required this.value}) : super(key: key);
  final int value;

  @override
  Widget build(BuildContext context) {
    final int firstDigit = (value ~/ 10) % 10;
    final int lastDigit = value % 10;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Digit(value: firstDigit), Digit(value: lastDigit)],
    );
  }
}
