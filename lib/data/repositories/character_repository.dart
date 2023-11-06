import 'dart:convert';

import 'package:rest_api_ram/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    try {
      var response = await http.get(Uri.parse(url + '?page=$page&name=$name'));
      var jsonResult = json.decode(response.body);
      print(jsonResult);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Results>> getSaveCharacterById(List<int> ids) async {
    String id = "";

    ids.forEach((element) {
      id += "$element,";
    });

    var response = await http.get(Uri.parse("$url/$id"));

    var jsonParse = json.decode(response.body);

    var list = jsonParse
        .map((item) => Results.fromJson(item))
        .cast<Results>()
        .toList();

    return list;
  }
}
