import 'package:pokemon/net/api.dart';
import 'package:pokemon/model/Pokemon.dart';

class PokemonData {
  static Future<List<Pokemon>> getPokemonList({page = 1, perpage = 12}) async {
    final url = "/pokemon";

    final response = await httpManager.fetch(url, {page, perpage}, null);
    // map
    final pokemonList =
        response.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();

    return pokemonList;
  }
}
