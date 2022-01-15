import 'package:flutter/material.dart';

const _fontSize = 40.0;

class Digit extends StatefulWidget {
  const Digit({Key? key, required this.value}) : super(key: key);
  final int value;

  @override
  State<Digit> createState() => _DigitState();
}

class _DigitState extends State<Digit> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int? oldValue;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: _fontSize,
    );
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant Digit oldWidget) {
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
    return Container(
      color: Colors.white30,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: _fontSize,
      width: _fontSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (oldValue != null)
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Positioned(
                  top: -_animationController.value,
                  child: child!,
                );
              },
              child: _DigitValue(digit: oldValue!),
            ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Positioned(
                top: _fontSize - _animationController.value,
                child: child!,
              );
            },
            child: _DigitValue(digit: widget.value),
          ),
        ],
      ),
    );
  }
}

class _DigitValue extends StatelessWidget {
  const _DigitValue({Key? key, required this.digit}) : super(key: key);

  final int digit;

  @override
  Widget build(BuildContext context) {
    return Text(
      digit.toString(),
      style: const TextStyle(
        fontSize: _fontSize,
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
