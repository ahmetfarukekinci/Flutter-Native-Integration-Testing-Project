import 'package:flutter/material.dart';

class CharacterDetailInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const CharacterDetailInfoRow(
      {super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(children: [
        Icon(
          icon,
          size: 50,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ]),
    );
  }
}
