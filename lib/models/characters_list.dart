import 'package:sc_rick_and_morty/models/character.dart';
import 'package:sc_rick_and_morty/models/characters_list_info.dart';

class CharacterListResponse {
  final CharactersListInfo info;
  final List<Character> results;

  CharacterListResponse({required this.info, required this.results});

  factory CharacterListResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'info': Map<String, dynamic> info, 'results': List<dynamic> results} =>
        CharacterListResponse(
            info: CharactersListInfo.fromJson(info),
            results: results.map((e) => Character.fromJson(e)).toList()),
      _ => throw const FormatException('Failed to load characters info.'),
    };
  }
}
