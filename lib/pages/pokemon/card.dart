import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/constants.dart';
import 'package:pokemon/pages/pokemon/routes.dart' as routes;

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final Pokemon pokemon;

  String _getImageUrl(sourceIndex) {
    final imgUrl = 'assets/pic/' + sourceIndex.toString() + '的副本.gif';
    return imgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // AlertDialog alert = AlertDialog(
          //   title: Text(pokemon.name),
          // );
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return alert;
          //   },
          // );
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
                height: 120,
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
                        height: 30,
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
                          children: pokemon.type
                              .map((e) => Container(
                                    width: 36,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(pokemonTypeMap[e]!.color),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      pokemonTypeMap[e]!.name,
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
                alignment: Alignment(0, -1.6),
                child: Hero(
                    tag: pokemon.id,
                    child: Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                          _getImageUrl(pokemon.id),
                        ),
                        // image: AssetImage('assets/pic/2.gif'),
                        alignment: Alignment.bottomCenter,
                        fit: BoxFit.scaleDown,
                      )),
                    )),
              ),
              Align(
                  alignment: Alignment(0, .7),
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
                            pokemon.state.toString(),
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
