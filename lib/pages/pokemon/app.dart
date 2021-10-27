import 'package:flutter/material.dart';

import 'package:pokemon/pages/pokemon/list.dart';
import 'package:pokemon/pages/pokemon/detail.dart';
import 'package:pokemon/pages/pokemon/routes.dart' as routes;

class PokemonApp extends StatelessWidget {
  static const String listRoute = routes.listRoute;
  static const String detailRoute = routes.detailRoute;

  @override
  Widget build(BuildContext context) {
    return PokemonList();
    // MaterialApp(
    //   title: 'Pokemon',
    //   debugShowCheckedModeBanner: false,
    //   initialRoute: listRoute,
    //   routes: <String, WidgetBuilder>{
    //     listRoute: (context) => PokemonList(),
    //   },
    //   theme: ThemeData(
    //     scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
    //     fontFamily: 'IPix',
    //     textTheme: const TextTheme(
    //         // headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    //         // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    //         // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    //         ),
    //   ),
    // );
  }
}
