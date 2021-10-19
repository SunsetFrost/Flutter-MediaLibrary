import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/constants.dart';
import 'package:pokemon/utils/utils.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key, required this.pokemons}) : super(key: key);

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
              return _CarouseCard(
                pokemon: pokemons[index],
              );
              // return Container(
              //   height: 200,
              //   padding: const EdgeInsets.all(8),
              //   child: const Text('Heed not the rabble'),
              //   color: Colors.green[200],
              // );
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
    final mockType = ['ground', 'grass'];
    return Stack(
        key: ValueKey(pokemon.id),
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            // height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width / 3.5,
            height: 120,
            // left: 10.0,
            top: 40,
            child: Card(
              color: Color.fromRGBO(40, 44, 82, 1.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 28,
                  ),
                  Text(
                    '妙蛙种子',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromRGBO(190, 193, 215, 1.0),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: mockType
                          .map((e) => Container(
                                width: 30,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(pokemonTypeColor[e]!),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '草',
                                  style: TextStyle(
                                      color: Colors.white60, fontSize: 10),
                                ),
                              ))
                          .toList())
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -1.3),
            child: Hero(
                tag: pokemon.id,
                child: Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    // image: NetworkImage(
                    //   getImageUrl(pokemon.id),
                    // ),
                    image: AssetImage('assets/pic/2.gif'),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.scaleDown,
                  )),
                )),
          ),
          Align(
              alignment: Alignment(0, 0.7),
              child: Container(
                  width: 54,
                  height: 26,
                  // padding: EdgeInsets.symmetric(horizontal: 6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244, 176, 22, 1.0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flash_on_outlined,
                        size: 12,
                      ),
                      Text(
                        '426',
                        style: TextStyle(
                          color: Color.fromRGBO(40, 44, 82, 0.6),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )))
        ]);
  }
}
