import 'package:flutter/material.dart';
import 'package:pokemon/model/Pokemon.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return Image.network(pokemons[index].img);
        });
  }
}
