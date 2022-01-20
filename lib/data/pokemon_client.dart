import 'dart:convert';

import 'package:unit_test_example/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonClient {
  final String url = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> getPokemon() async {
    List<Pokemon> pokemons = [];
    for (int i = 1; i <= 10; i++) {
      var response = await http.get(Uri.parse('$url/$i'));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        pokemons.add(Pokemon.fromJson(json));
      }
    }
    return pokemons;
  }
}
