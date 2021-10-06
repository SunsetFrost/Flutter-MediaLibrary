import 'dart:convert';
import 'dart:io' as Io;
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/list.dart';
import 'package:pokemon/test.dart';

void main() {
  runApp(MaterialApp(
    title: "Pokemon App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

Future<List<Pokemon>> fetchData() async {
  final url = "http://127.0.0.1:7001/api/v1/pokemon?page=1&perpage=10";

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

  Image decodeBase642Image(source) {
    Uint8List decodeBytes = base64Decode(source);

    return Image.memory(decodeBytes);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frost Pokemon App"),
        backgroundColor: Colors.lightBlue[300],
      ),
      body: Center(
        child: FutureBuilder<List<Pokemon>>(
          future: pokeList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PokemonList(pokemons: snapshot.data!);
              // return ListView.builder(
              //     padding: const EdgeInsets.all(8),
              //     itemCount: snapshot.data!.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return Container(
              //         height: 50,
              //         child: Center(
              //             child: decodeBase642Image(snapshot.data![index])),
              //       );
              //     });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TestWidget()));
        },
        child: const Icon(Icons.add_circle),
        backgroundColor: Colors.green,
      ),
    );
  }
}
