import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sc_rick_and_morty/models/character.dart';

class GetCharacter {
  Future<Character?> load(int characterIndex) async {
    String characterPath = 'character/$characterIndex';
    Uri url = Uri.https('https://rickandmortyapi.com/api/', characterPath);
    final http.Response response = await http.get(url);
    final data = jsonDecode(response.body);
    final character = Character.fromJson(data);
    return character;
  }
}
