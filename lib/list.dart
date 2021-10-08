import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/constants.dart';
import 'package:pokemon/utils.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    print(pokemons);
    return
        // Text('test list');
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              return _CarouseCard(
                pokemon: pokemons[index],
              );
            });
  }
}

class _CarouseCard extends StatelessWidget {
  const _CarouseCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  String getImageUrl(sourceIndex) {
    final imgUrl = backendURI + '/image/' + sourceIndex.toString() + '.gif';
    return imgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(pokemon.id),
      alignment: Alignment.center,
      child: Card(
        color: Color.fromRGBO(40, 44, 82, 1.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              getImageUrl(pokemon.id),
              width: 100,
              height: 80,
            ),
            Text(
              capitalize(pokemon.name),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromRGBO(190, 193, 215, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
