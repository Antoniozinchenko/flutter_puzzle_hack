import 'package:flutter/material.dart';
import 'package:puzzle_hack/widgets/game_stats/clock_view/flipping_digit.dart';

class DigitPair extends StatelessWidget {
  const DigitPair({Key? key, required this.value}) : super(key: key);
  final int? value;

  @override
  Widget build(BuildContext context) {
    final int? firstDigit = value != null ? (value! ~/ 10) % 10 : null;
    final int? lastDigit = value != null ? value! % 10 : null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlippingDigit(value: firstDigit),
        FlippingDigit(value: lastDigit)
      ],
    );
  }
}
