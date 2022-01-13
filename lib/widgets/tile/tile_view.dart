import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzle_hack/bloc/winner_state.dart';

class TileView extends StatefulWidget {
  const TileView({
    Key? key,
    required this.value,
    required this.size,
    required this.valid,
  }) : super(key: key);

  final int value;
  final double size;
  final bool valid;

  @override
  State<TileView> createState() => _TileViewState();
}

class _TileViewState extends State<TileView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: 1.2), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.2), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1), weight: 30),
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
    final winner = context.watch<WinnerState>().value;
    final color = winner ? Colors.green.shade400 : Colors.blue.shade400;
    return Container(
      padding: const EdgeInsets.all(2),
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(widget.size * 0.1),
          ),
          child: Center(
            child: Text(
              widget.value.toString(),
              style: TextStyle(
                fontSize: widget.size * 0.6,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
