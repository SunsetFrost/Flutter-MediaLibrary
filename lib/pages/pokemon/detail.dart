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
    final bgColor =
        Color(pokemonTypeMap[pokemon.types[0].name]?.color ?? 0xFF76BB6C);

    final infoTextStyle = TextStyle(
      // color: Color.fromRGBO(190, 193, 215, 1.0),
      color: Colors.grey[600],
      fontSize: 18.0,
    );
    final infoTextSecondaryStyle = TextStyle(
      color: Color.fromRGBO(244, 176, 22, 1.0),
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );
    print(pokemon.toString());

    return Scaffold(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: bgColor,
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
                    style: TextButton.styleFrom(primary: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  pokemon.name,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: pokemon.types
                      .map((e) => Container(
                            width: 64,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: Color(pokemonTypeMap[e.name]!.color),
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              pokemonTypeMap[e.name]!.name,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
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
                color: bgColor,
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
                      image: NetworkImage(
                          imageServerURI + pokemon.id.toString() + '.gif'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // alignment: Alignment(2.0, 1.8),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1000,
            padding: EdgeInsets.symmetric(horizontal: 30),
            // color: Colors.orangeAccent,
            color: Theme.of(context).backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   height: 16,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          '高度',
                          style: infoTextStyle,
                        ),
                        Text(
                          '12.05',
                          style: infoTextSecondaryStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '重量',
                          style: infoTextStyle,
                        ),
                        Text(
                          '4.05',
                          style: infoTextSecondaryStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '种类',
                          style: infoTextStyle,
                        ),
                        Text(
                          '24.00',
                          style: infoTextSecondaryStyle,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ...pokemon.stats
                    .map(
                      (stat) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.0,
                            // constraints: BoxConstraints(
                            //   maxWidth: 100.0,
                            // ),
                            child: Text(
                              stat.name,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Slider(
                            value: stat.baseStat.toDouble(),
                            onChanged: (double value) {},
                            min: 0,
                            max: 255,
                          ),
                          Text(
                            stat.baseStat.toString(),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ],
            ),
          )
        ]));
  }
}
