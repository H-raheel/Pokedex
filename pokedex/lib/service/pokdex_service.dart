import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon_model.dart';

class PokedexService {
  Future<List<Pokemon>> getAllPokemons() async {
    Uri uri = Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)["pokemon"] as List;
      print(json);
      List<Pokemon> pokemonList = List<Pokemon>.from(
        json.map(
          (dynamic items) => Pokemon.fromJson(items),
        ),
      );

      return pokemonList;
    }
    return [];
  }
}

// List<Pokemon> pokemonList = (json as List<dynamic>).map(
//   (dynamic item) => Pokemon.fromJson(item),
// ).toList();