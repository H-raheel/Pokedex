import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/service/pokdex_service.dart';

class PokemonProvider extends ChangeNotifier {
  final _service = PokedexService();
  bool isLoading = false;
  List<Pokemon> _pokemon = [];
  List<Pokemon> get pokemon => _pokemon;

  Future<void> getAllPokemon() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAllPokemons();

    _pokemon = response;
    isLoading = false;
    notifyListeners();
  }
}
