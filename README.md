# 15 Puzzle Game

[Game Website](https://flutter-puzzle-hack.web.app/#/)

This is my project for [Flutter Puzzle Hack Challenge](https://flutterhack.devpost.com/)

## Game Concept
- You can only swipe one tile at a time on the board.

- Board state is just array with 15 numbers and last null element

- For checking win state, just need to compare board state array with the same sorted array (null item should be last)

- Start timer if moves count equal 1. Stop timer if moves count equals zero or user won game (also check best score in this case)


### Additional Dependencies
This project is quite lightweight and have only few dependencies.
- Provider
- Shared Preferences