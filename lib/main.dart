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

Future<List<String>> fetchData() async {
  final url = "https://pokeapi.co/api/v2/pokemon/?limit=10";

  final response = await http.get(Uri.parse((url)));
  if (response.statusCode == 200) {
    return parseData(response.body);
  } else {
    throw Exception('Failed fetch pokemon data!');
  }
}

List<String> parseData(response) {
  final parsed = jsonDecode(response);
  // final pokemonList =
  //     parsed.map<Pokemon>((json) => Pokemon.fromJson(json)).toList();
  final pokemonNameList =
      parsed['results'].map((item) => item['name']).toList();

  final result = List<String>.from(pokemonNameList);

  return result;
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  late Future<List<String>> pokeList;

  @override
  void initState() {
    super.initState();
    pokeList = fetchData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frost Pokemon App"),
        backgroundColor: Colors.lightBlue[300],
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: pokeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // return PokemonList(pokemons: snapshot.data!);
              return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child:
                          Center(child: Text('Entry ${snapshot.data![index]}')),
                    );
                  });
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
