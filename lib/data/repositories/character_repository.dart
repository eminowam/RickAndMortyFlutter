import 'dart:convert';

import 'package:rest_api_ram/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepository {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    try {
      var response = await http.get(Uri.parse(url + '?page=$page&name=$name'));
      var jsonResult=json.decode(response.body);
      return Character.fromJson(jsonResult);
    }catch (e){
      throw Exception(e.toString());
    }
  }

  Future<Character> getSaveCharacterById(List<String> ids) async{
    var response= await http.get(Uri.parse("$url${ids.map((e) => "$e,").cast<String>().toList()}"));
    var jsonResult=json.decode(response.body);
    return Character.fromJson(jsonResult);

  }
}
