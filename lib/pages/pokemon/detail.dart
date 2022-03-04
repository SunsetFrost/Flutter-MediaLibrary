import 'package:flutter/material.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/pages/pokemon/routes.dart';
import 'package:media_library/widgets/sword_paint.dart';

class PokemonDetail extends StatelessWidget {
  PokemonDetail({Key? key, required this.args})
      : _repo = LibraryRepository(baseUrl: backendURI, type: APIType.pokemon),
        super(key: key);

  final DetailArguments args;
  final LibraryRepository _repo;

  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _repo.getDetail(args.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DetailPage(pokemon: snapshot.data);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: SwordLoading(
              loadColor: Colors.white,
              size: 60,
            ),
          );
        });
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Color(0xFF76BB6C),
        body: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.chevron_left),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop();
                    },
                    child: Icon(Icons.favorite_border),
                    style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Text(
                  pokemon.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: pokemon.types
                      .map((e) => Container(
                            width: 48,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(pokemonTypeMap[e.name]!.color),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              pokemonTypeMap[e.name]!.name,
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ))
                      .toList()),
              SizedBox(
                height: 20,
              )
            ],
          ),
          // Container(
          //     height: 150,
          //     color: Color(0xFF76BB6C),
          //     child: Row(
          //       children: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: Icon(Icons.chevron_left),
          //           style: TextButton.styleFrom(
          //               primary: Theme.of(context).colorScheme.secondary),
          //         )
          //       ],
          //     )),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                color: Color(0xFF76BB6C),
                // color: Colors.pinkAccent,
              ),
              Positioned(
                top: 100,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0)))),
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  top: 20,
                  child: Container(
                      width: 100,
                      height: 100,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(imageServerURI +
                            '/image/' +
                            pokemon.id.toString() +
                            '.gif'),
                        fit: BoxFit.cover,
                      )))
                  // alignment: Alignment(2.0, 1.8),
                  ),
            ],
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 1000,
              padding: EdgeInsets.symmetric(horizontal: 30),
              // color: Colors.orangeAccent,
              color: Theme.of(context).backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            '高度',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '2.05',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '重量',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '2.05',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '种类',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            '2.05',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '力量',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        '132',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Slider(
                        value: 132,
                        onChanged: (double value) {},
                        min: 0,
                        max: 255,
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
