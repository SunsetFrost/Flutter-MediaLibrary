import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/list.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokemon App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

Future<List<Pokemon>> fetchData() async {
  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  final response = await http.get(Uri.parse((url)));
  if (response.statusCode == 200) {
    return parseData(response.body);
  } else {
    throw Exception('Failed fetch pokemon data!');
  }
}

List<Pokemon> parseData(response) {
  final parsed = jsonDecode(response)['pokemon'];
  final pokemonList =
      parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Frost Pokemon App"),
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: pokeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PokemonList(pokemons: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
