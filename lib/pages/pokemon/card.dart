import 'package:flutter/material.dart';

import 'package:pokemon_api/pokemon_api.dart';
import 'package:media_library/constants.dart';
import 'package:media_library/pages/pokemon/routes.dart' as routes;

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  // String _getImageUrl(sourceIndex) {
  //   final imgUrl = 'assets/pic/' + sourceIndex.toString() + '的副本.gif';
  //   return imgUrl;
  // }

  @override
  Widget build(BuildContext context) {
    print(pokemon.image);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(routes.detailRoute,
              arguments: routes.DetailArguments(pokemon.id));
        },
        child: Stack(
            key: ValueKey(pokemon.id),
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                // height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width / 3.2,
                height: MediaQuery.of(context).size.width / 3.2 * 1.0,
                // left: 10.0,
                top: 30,
                child: Card(
                  color: Theme.of(context).cardColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        pokemon.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: pokemon.types
                              .map((e) => Container(
                                    width: 36,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          Color(pokemonTypeMap[e.name]!.color),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      pokemonTypeMap[e.name]!.name,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ))
                              .toList())
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -1.4),
                child: Hero(
                  tag: pokemon.id,
                  child: Image.network(
                    pokemon.image,
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                // Container(
                //   width: 80,
                //   height: 80,
                //   alignment: Alignment.bottomCenter,
                //   decoration: BoxDecoration(
                //       image: DecorationImage(
                //     image: AssetImage(
                //       _getImageUrl(pokemon.id),
                //     ),
                //     alignment: Alignment.bottomCenter,
                //     fit: BoxFit.scaleDown,
                //   )),
                // )),
              ),
              Align(
                  alignment: Alignment(0, .9),
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
                            pokemon.stats
                                .reduce((value, element) => Stat(
                                    'accm', value.baseStat + element.baseStat))
                                .baseStat
                                .toString(),
                            style: TextStyle(
                              color: Color.fromRGBO(40, 44, 82, 0.6),
                              fontFamily: 'IPix',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )))
            ]));
  }
}
