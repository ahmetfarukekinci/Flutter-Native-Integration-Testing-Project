import 'package:flutter/material.dart';

final darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 6, 6, 226),
    background: const Color.fromARGB(68, 103, 123, 188));

final darkTheme = ThemeData.dark().copyWith(
    colorScheme: darkColorScheme,
    cardTheme: const CardTheme(
        surfaceTintColor: Color.fromARGB(195, 78, 74, 74),
        color: Color.fromARGB(255, 30, 28, 28)),
    textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)));
