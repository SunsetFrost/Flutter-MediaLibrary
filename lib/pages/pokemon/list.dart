import 'package:flutter/material.dart';

import 'package:pokemon/model/Pokemon.dart';
import 'package:pokemon/net/pokemon_data.dart';
import 'package:pokemon/pages/pokemon/card.dart';
import 'package:pokemon/widgets/sword_paint.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SearchWidget(),
            SizedBox(
              height: 12,
            ),
            FilterWidget(),
            Expanded(
                child: FutureBuilder<List<Pokemon>>(
                    future: PokemonData.getPokemonList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                            // Container(
                            //   width: 100,
                            //   height: 100,
                            //   color: Colors.white,
                            // );
                            PokemonGrid(pokemons: snapshot.data!);
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
        padding: EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return
              // Container(
              //   width: MediaQuery.of(context).size.width / 3.8,
              //   color: Colors.blueAccent,
              //   child: Text(index.toString()),
              // );
              PokemonCard(
            pokemon: pokemons[index],
          );
        });
  }
}

// 搜索组件
class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hintText: '请输入搜索的口袋妖怪',
              hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
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
    ));
  }
}

/*
  filter组件
*/
class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool _isPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    final _buttonStyle = TextButton.styleFrom(
      primary: Colors.white54,
      // alignment: Alignment.centerLeft,
      textStyle: const TextStyle(
        fontSize: 14,
        fontFamily: 'IPix',
      ),
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: _buttonStyle,
              onPressed: () {
                setState(() {
                  _isPanelVisible = !_isPanelVisible;
                });
              },
              child: const Text('属性'),
            ),
            TextButton(
              style: _buttonStyle,
              onPressed: () {
                setState(() {
                  _isPanelVisible = !_isPanelVisible;
                });
              },
              child: const Text('类别'),
            ),
            TextButton(
              style: _buttonStyle,
              onPressed: () {
                setState(() {
                  _isPanelVisible = !_isPanelVisible;
                });
              },
              child: Row(
                children: <Widget>[Text('种族值'), Icon(Icons.arrow_drop_down)],
              ),
            ),
          ],
        ),
        Visibility(
            visible: _isPanelVisible,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 4),
            ))
      ],
    );
  }
}
