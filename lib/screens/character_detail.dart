import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';
import 'package:sc_rick_and_morty/models/character.dart';
import 'package:sc_rick_and_morty/widgets/character_detail_info_row.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    void updateAndroidWidget() {
      HomeWidget.saveWidgetData("title", character.name);
      HomeWidget.saveWidgetData("image", character.image);
      HomeWidget.updateWidget(
        androidName: "CharacterHomeWidget",
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              character.image,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            CharacterDetailInfoRow(text: character.species, icon: Icons.person),
            CharacterDetailInfoRow(
                icon: Icons.transgender, text: character.gender),
            CharacterDetailInfoRow(
                icon: Icons.favorite, text: character.status),
            TextButton(
                onPressed: () {
                  updateAndroidWidget();
                },
                child: const Text("Update Widget"))
          ],
        ),
      ),
    );
  }
}
