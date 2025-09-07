import 'package:flutter/material.dart';
import 'package:the_gridlock/game_board.dart';

class ThemeMood extends StatefulWidget {
  const ThemeMood({super.key});

  @override
  State<ThemeMood> createState() => _ThemeMoodState();
}

class _ThemeMoodState extends State<ThemeMood> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final light = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo, brightness: Brightness.light),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(centerTitle: true),
    );

    final dark = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white, brightness: Brightness.dark),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(centerTitle: true),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridLock(themeMode: _themeMode, toggleTheme: _toggleTheme),
      theme: light,
      darkTheme: dark,
      themeMode: _themeMode,
    );
  }
}