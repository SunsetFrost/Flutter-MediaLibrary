import 'package:media_library/net/api.dart';
import 'package:media_library/model/Pokemon.dart';

class PokemonData {
  static _refactorPokemonJson(json) {
    final pokemonJson =
        json['data']['pokemon_v2_pokemonspecies'].map((json) => {
              'name': json['pokemon_v2_pokemonspeciesnames'][0]['name'],
              'id': json['pokemon_v2_pokemons'][0]['id'],
              'name_en': json['pokemon_v2_pokemons'][0]['name'],
              'type': json['pokemon_v2_pokemons'][0]['pokemon_v2_pokemontypes']
                  .map((type) => type['pokemon_v2_type']['name'])
                  .toList(),
              'state': json['pokemon_v2_pokemons'][0]
                      ['pokemon_v2_pokemonstats_aggregate']['aggregate']['sum']
                  ['base_stat'],
            });
    return pokemonJson;
  }

  static Future<List<Pokemon>> getPokemonList({page = 1, perpage = 12}) async {
    final url = "/pokemon";

    final response = await httpManager.fetch(url);
    final pokemonJson = _refactorPokemonJson(response);
    // map
    final pokemonList =
        pokemonJson.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();

    return pokemonList;
  }
}

// Future<List<Pokemon>> fetchData() async {
//   final url = "/pokemon?page=1&perpage=12";

//   final response =
//       await httpManager.fetch(url, {'page': 1, 'perpage': 12}, null);
//   if (response.statusCode == 200) {
//     return parseData(response.body);
//   } else {
//     throw Exception('Failed fetch pokemon data!');
//   }
// }

// List<Pokemon> parseData(response) {
//   final parsed = jsonDecode(response);
//   final pokemonList =
//       parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
//   // final pokemonNameList = parsed.map((item) => item['img']).toList();

//   // final result = List<String>.from(pokemonList);

//   return pokemonList;
// }
