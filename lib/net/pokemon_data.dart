import 'package:media_library/net/api.dart';
import 'package:media_library/model/Pokemon.dart';

class PokemonData {
  static Future<List<Pokemon>> getPokemonList({page = 1, perpage = 12}) async {
    final url = "/pokemon";

    final response = await httpManager.fetch(url);

    // map
    final pokemonList =
        response.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();

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
