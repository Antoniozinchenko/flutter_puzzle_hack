import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme(
          background: const Color(0xFF000000),
          brightness: Brightness.dark,
          primary: Colors.amber.shade700,
          primaryVariant: Colors.amber.shade900,
          error: Colors.redAccent,
          onBackground: Colors.white,
          onError: Colors.white,
          onPrimary: Colors.brown.shade800,
          onSecondary: Colors.black,
          onSurface: const Color(0xFF222222),
          secondary: Colors.brown.shade600,
          secondaryVariant: Colors.brown.shade900,
          surface: Colors.white70,
        ),
        textTheme: const TextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ),
  );
}
