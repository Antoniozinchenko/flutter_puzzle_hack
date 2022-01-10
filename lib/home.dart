import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'board.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int gridSize = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle Hack App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoSegmentedControl(
                groupValue: gridSize,
                onValueChanged: (int value) {
                  setState(() {
                    gridSize = value;
                  });
                },
                children: const {
                  3: Text('Easy'),
                  4: Text('Medium'),
                  5: Text('Hard'),
                },
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Board(gridSize: gridSize),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
