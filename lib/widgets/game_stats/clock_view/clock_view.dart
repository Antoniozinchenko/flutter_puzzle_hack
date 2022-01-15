import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'digit_pair.dart';

class ClockView extends StatelessWidget {
  const ClockView({Key? key, required this.value, required this.color})
      : super(key: key);

  final int? value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final int? seconds = value != null ? value! % 60 : null;
    final int? minutes = value != null ? value! ~/ 60 : null;

    return Provider<Color>(
      create: (_) => color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitPair(value: minutes),
          const Text(
            ':',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 30,
            ),
          ),
          DigitPair(value: seconds)
        ],
      ),
    );
  }
}
