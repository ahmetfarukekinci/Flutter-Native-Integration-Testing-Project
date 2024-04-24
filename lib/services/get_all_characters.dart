import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sc_rick_and_morty/models/characters_list.dart';

class GetAllCharacters {
  Uri? nextPageUrl = Uri.https('https://rickandmortyapi.com/api/character');

  Future<CharacterListResponse?> downloadNextPage() async {
    if (nextPageUrl == null) {
      return null;
    }

    final http.Response response = await http.get(nextPageUrl!);

    final responseData = jsonDecode(response.body);
    final charactersList = CharacterListResponse.fromJson(responseData);

    return charactersList;
  }
}
