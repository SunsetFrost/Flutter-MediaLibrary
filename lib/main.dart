import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon/pokemon.model.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokemon App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  final testUrl = 'https://jsonplaceholder.typicode.com/albums/1';

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  Future<PokemonModel> fetchData() async {
    final response = await http.get(Uri.parse((url)));
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed fetch pokemon data!');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frost Pokemon App"),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
