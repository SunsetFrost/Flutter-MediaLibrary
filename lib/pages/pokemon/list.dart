import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/net/pokemon_data.dart';
import 'package:pokemon/pages/pokemon/card.dart';
import 'package:pokemon/widgets/sword_paint.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 12,
                bottom: 20,
              ),
              child: Text(
                '口袋图鉴',
                style: TextStyle(
                  color: Color.fromRGBO(244, 176, 22, 1.0),
                  fontFamily: 'IPix',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 10,
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<Pokemon>>(
                    future: PokemonData.getPokemonList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PokemonGrid(pokemons: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const Center(
                        child: SwordLoading(
                          loadColor: Colors.white,
                          size: 60,
                        ),
                      );
                    }))
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        child: const Icon(Icons.home),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

// 口袋妖怪网格组件
class PokemonGrid extends StatelessWidget {
  const PokemonGrid({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return
        // Text('test list');
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.6,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: pokemons.length,
            itemBuilder: (context, index) {
              return PokemonCard(
                pokemon: pokemons[index],
              );
            });
  }
}
