import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _fontSize = 40.0;

class FlippingDigit extends StatefulWidget {
  const FlippingDigit({Key? key, required this.value}) : super(key: key);
  final int? value;

  @override
  State<FlippingDigit> createState() => _FlippingDigitState();
}

class _FlippingDigitState extends State<FlippingDigit>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _flipAnimation;

  int? oldValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0,
      upperBound: 1,
    );
    _flipAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut);
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant FlippingDigit oldWidget) {
    if (oldWidget.value != widget.value) {
      setState(() {
        oldValue = oldWidget.value;
        _animationController.reset();
        _animationController.forward();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _flipAnimation,
      builder: (context, _) {
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.01)
          ..rotateX(_flipAnimation.value * pi);

        if (_flipAnimation.value >= 0.5) {
          transform
            ..rotateZ(pi)
            ..rotateY(pi);
        }
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: _DigitValue(
            digit: _flipAnimation.value >= 0.5 ? widget.value : oldValue,
          ),
        );
      },
    );
  }
}

class _DigitValue extends StatelessWidget {
  const _DigitValue({Key? key, required this.digit}) : super(key: key);

  final int? digit;

  @override
  Widget build(BuildContext context) {
    const width = _fontSize * 0.8;
    final color = context.read<Color>();
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.white24,
          margin: const EdgeInsets.all(2),
          width: width,
          height: _fontSize,
        ),
        Text(
          '${digit ?? ""}',
          style: TextStyle(
            fontSize: _fontSize,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          color: const Color(0xFFaaaaaa),
          height: 3,
          width: width,
        )
      ],
    );
  }
}
