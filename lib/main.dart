import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/list.dart';
import 'package:pokemon/sword_paint.dart';
import 'package:pokemon/constants.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokemon App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

Future<List<Pokemon>> fetchData() async {
  final url = backendURI + apiVersion + "/pokemon?page=1&perpage=12";

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return parseData(response.body);
  } else {
    throw Exception('Failed fetch pokemon data!');
  }
}

List<Pokemon> parseData(response) {
  final parsed = jsonDecode(response);
  final pokemonList =
      parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  // final pokemonNameList = parsed.map((item) => item['img']).toList();

  // final result = List<String>.from(pokemonList);

  return pokemonList;
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late Future<List<Pokemon>> pokeList;

  @override
  void initState() {
    super.initState();
    pokeList = fetchData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        theme:
            ThemeData(scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0)),
        home: Scaffold(
          backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 60, left: 10),
                  child: Text(
                    'PokeIndex',
                    style: TextStyle(
                      color: Color.fromRGBO(244, 176, 22, 1.0),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                    child: FutureBuilder<List<Pokemon>>(
                        future: pokeList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return PokemonList(pokemons: snapshot.data!);
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
              ],
            ),
          ),
        ));
  }
}
