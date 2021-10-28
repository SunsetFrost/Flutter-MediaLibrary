import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/net/pokemon_data.dart';
import 'package:pokemon/pages/pokemon/card.dart';
import 'package:pokemon/widgets/sword_paint.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                // left: 12,
                bottom: 20,
              ),
              child: Text(
                '口袋图鉴',
                style: TextStyle(
                  color: Color.fromRGBO(244, 176, 22, 1.0),
                  fontFamily: 'IPix',
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 10,
                ),
              ),
            ),
            Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      hintText: '请输入搜索的口袋妖怪',
                      hintStyle: TextStyle(
                          fontFamily: 'IPix',
                          color: Colors.white54,
                          fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      fillColor: Colors.white12,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.white54,
                      )),
                )
              ],
            )),
            Expanded(
                child: FutureBuilder<List<Pokemon>>(
                    future: PokemonData.getPokemonList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return PokemonGrid(pokemons: snapshot.data!);
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
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/');
        },
        child: const Icon(Icons.home),
        backgroundColor: Colors.orangeAccent,
      ),
    );
  }
}

// 口袋妖怪网格组件
class PokemonGrid extends StatelessWidget {
  const PokemonGrid({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          childAspectRatio: 0.6,
        ),
        // padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return
              // Container(
              //   width: MediaQuery.of(context).size.width / 3.8,
              //   height: 120.0,
              //   color: Colors.blueAccent,
              // );
              PokemonCard(
            pokemon: pokemons[index],
          );
        });
  }
}
