import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: 1.1), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.1), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1), weight: 30),
    ]).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
