import 'package:flutter_test/flutter_test.dart';

import 'package:pokemon_api/pokemon_api.dart';

void main() {
  late PokemonAPIClient pokemonAPIClient;
  group('pokemon API', () {
    setUpAll(() {
      pokemonAPIClient = PokemonAPIClient(baseUrl: 'http://127.0.0.1:3000');
    });

    test('pokemon list', () async {
      final list = await pokemonAPIClient.getPopularList({'page': 1});
      print(list);
      expect(list, isList);
    });

    test('pokemon detail', () async {
      final pokemon = await pokemonAPIClient.getDetail('1');
      print(pokemon);
      expect(pokemon, isInstanceOf<Pokemon>());
    });
  });
}
