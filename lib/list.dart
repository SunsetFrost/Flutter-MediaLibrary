import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    print(pokemons);
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[_CarouseCard(pokemon: pokemons[index])],
          );
        });
  }
}

class _CarouseCard extends StatelessWidget {
  const _CarouseCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  String getImageUrl(source) {
    return 'http://127.0.0.1/image/${source}.gif';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(pokemon.id),
      margin: EdgeInsets.all(8),
      child: Material(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.network(
              getImageUrl(pokemon.id),
              width: 100,
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(pokemon.name),
            )
          ],
        ),
      ),
    );
  }
}
