import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/models/pokemon_model.dart';

class PokedexProvider extends ChangeNotifier {
  List<PokemonModel> pokemons = [];
  PokemonModel? pokemonSelected;
  int _startValue = 1;
  int _endValue = 50;
  final int _increment = 50;

  Future<PokemonModel?> _fetchPokemon(int id) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return PokemonModel.fromJson(data);
    } else {
      // Si la solicitud no fue exitosa, imprime el código de estado.
      // ignore: avoid_print
      print('Error en la solicitud: ${response.statusCode}');
      return null;
    }
  }

  Future<void> _fetchAndAddPokemons(int start, int end) async {
    for (int id = start; id <= end; id++) {
      final pokemon = await _fetchPokemon(id);
      if (pokemon != null) {
        pokemons.add(pokemon);
        notifyListeners();
      }
    }
  }

  Future<void> fetchPokemons() async {
    await _fetchAndAddPokemons(_startValue, _endValue);
  }

  Future<void> fetchMorePokemons() async {
    _startValue += _increment;
    _endValue += _increment;
    await _fetchAndAddPokemons(_startValue, _endValue);
  }

  selectPokemon(PokemonModel pokemon) {
    pokemonSelected = pokemon;
  }

  PokemonModel searchPokemonById(int idPokemon) {
    var pokemon = pokemons.firstWhere((pokemon) => pokemon.id == idPokemon);
    return pokemon;
  }
}
