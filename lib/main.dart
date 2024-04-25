import 'package:flutter/material.dart';
import 'package:sc_rick_and_morty/screens/home.dart';
import 'package:sc_rick_and_morty/theme/dark_theme.dart';
import 'package:sc_rick_and_morty/theme/light_theme.dart';

void main() {
  runApp(const RickAndMorty());
}

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rick and Morty',
        theme: lighTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        home: Home(
          key: key,
        ));
  }
}
