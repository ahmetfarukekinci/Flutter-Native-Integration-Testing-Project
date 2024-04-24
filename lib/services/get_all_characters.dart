import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sc_rick_and_morty/models/characters_list.dart';

class GetAllCharacters {
  Future<CharacterListResponse?> downloadNextPage({Uri? nextPageUrl}) async {
    if (nextPageUrl == null) {
      return null;
    }

    final http.Response response = await http.get(nextPageUrl);

    final responseData = jsonDecode(response.body);
    final charactersList = CharacterListResponse.fromJson(responseData);

    return charactersList;
  }
}
