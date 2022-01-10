import 'package:flutter/material.dart';
import 'package:puzzle_hack/drag_direction.dart';

class Item extends StatefulWidget {
  const Item({
    Key? key,
    required this.size,
    required this.value,
    this.dragDirection,
    this.onSwap,
    required this.top,
    required this.left,
  }) : super(key: key);

  final double top;
  final double left;
  final double size;
  final int value;
  final DragDirection? dragDirection;
  final Function()? onSwap;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  double _dy = 0;
  double _dx = 0;

  _onVerticalDrag(DragUpdateDetails dragDetails) {
    setState(() {
      _dy += dragDetails.delta.dy;
      if ((widget.dragDirection == DragDirection.down && _dy < 0) ||
          (widget.dragDirection == DragDirection.up && _dy > 0)) {
        _dy = 0;
      } else if (_dy.abs() > widget.size) {
        _dy = _dy.isNegative ? -widget.size : widget.size;
      }
    });
  }

  _onVerticalDragEnd(DragEndDetails dragDetails) async {
    if (_dy.abs() < widget.size / 2) {
      setState(() {
        _dy = 0;
      });
    } else {
      setState(() {
        _dy = _dy.isNegative ? -widget.size : widget.size;
      });
      widget.onSwap!();
    }
  }

  _onHorizontalDrag(DragUpdateDetails dragDetails) {
    setState(() {
      _dx += dragDetails.delta.dx;
      if ((widget.dragDirection == DragDirection.right && _dx < 0) ||
          (widget.dragDirection == DragDirection.left && _dx > 0)) {
        _dx = 0;
      } else if (_dx.abs() > widget.size) {
        _dx = _dx.isNegative ? -widget.size : widget.size;
      }
    });
  }

  _onHorizontalDragEnd(DragEndDetails dragDetails) async {
    if (_dx.abs() < widget.size / 2) {
      setState(() {
        _dx = 0;
      });
    } else {
      setState(() {
        _dx = _dx.isNegative ? -widget.size : widget.size;
      });
      widget.onSwap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.top + _dy,
      left: widget.left + _dx,
      child: GestureDetector(
        onVerticalDragUpdate: widget.dragDirection == DragDirection.down ||
                widget.dragDirection == DragDirection.up
            ? _onVerticalDrag
            : null,
        onVerticalDragEnd: widget.dragDirection == DragDirection.down ||
                widget.dragDirection == DragDirection.up
            ? _onVerticalDragEnd
            : null,
        onHorizontalDragUpdate: widget.dragDirection == DragDirection.left ||
                widget.dragDirection == DragDirection.right
            ? _onHorizontalDrag
            : null,
        onHorizontalDragEnd: widget.dragDirection == DragDirection.left ||
                widget.dragDirection == DragDirection.right
            ? _onHorizontalDragEnd
            : null,
        child: Container(
          padding: const EdgeInsets.all(2),
          width: widget.size,
          height: widget.size,
          child: Container(
            color: Colors.blue.shade400,
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
      ),
    );
  }
}
