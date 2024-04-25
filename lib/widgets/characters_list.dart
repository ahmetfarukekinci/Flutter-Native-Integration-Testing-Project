import 'package:flutter/material.dart';
import 'package:sc_rick_and_morty/models/character.dart';

import 'package:sc_rick_and_morty/services/get_all_characters.dart';
import 'package:sc_rick_and_morty/widgets/character_card.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  List<Character> _charactersList = [];
  String? nextPageUrl;

  final ScrollController _scrollController = ScrollController();

  void getCharacters(
      {String? nextPage = 'https://rickandmortyapi.com/api/character'}) async {
    Uri? parsedUrl;

    if (nextPageUrl != null) {
      parsedUrl = Uri.parse(nextPage!);
    } else {
      parsedUrl = Uri.parse(nextPage!);
    }

    final response =
        await GetAllCharacters().downloadNextPage(nextPageUrl: parsedUrl);

    if (response != null) {
      setState(() {
        _charactersList += response.results;
        nextPageUrl = response.info.next;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    getCharacters();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      getCharacters(nextPage: nextPageUrl);
    }
  }

  Widget _buildList() {
    final int countedRow = (_charactersList.length / 2).ceil();

    return ListView.builder(
        controller: _scrollController,
        itemCount: countedRow,
        itemBuilder: (BuildContext context, int index) {
          final firstElement = _charactersList[index * 2];
          final secondElement = _charactersList[index * 2 + 1];
          return Row(
            children: [
              Expanded(
                  child: CharacterCard(
                      image: firstElement.image, name: firstElement.name)),
              const SizedBox(width: 8),
              Expanded(
                child: index * 2 + 1 < _charactersList.length
                    ? CharacterCard(
                        image: secondElement.image, name: secondElement.name)
                    : Container(),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: _buildList(),
    );
  }
}
