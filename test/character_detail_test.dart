import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'package:sc_rick_and_morty/models/character.dart';
import 'package:sc_rick_and_morty/screens/character_detail.dart';

final character = Character(
  id: 1,
  name: 'Rick Sanchez',
  species: 'Human',
  gender: 'Male',
  status: 'Alive',
  image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
);

Widget makeTestableWidget() =>
    MaterialApp(home: CharacterDetails(character: character));

void main() {
  testWidgets('CharacterPage widget test', (WidgetTester tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));

    expect(find.text('Rick Sanchez'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Human'), findsOneWidget);
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Alive'), findsOneWidget);
  });
}
