import 'package:flutter/material.dart';

import 'package:pokemon/pages/pokemon/list.dart';
import 'package:pokemon/pages/pokemon/detail.dart';
import 'package:pokemon/pages/pokemon/routes.dart' as routes;

class PokemonApp extends StatelessWidget {
  static const String listRoute = routes.listRoute;
  static const String detailRoute = routes.detailRoute;

  @override
  Widget build(BuildContext context) {
    // return PokemonList();
    return MaterialApp(
      title: 'Pokemon',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      routes: <String, WidgetBuilder>{
        listRoute: (context) => PokemonList(),
        detailRoute: (context) => PokemonDetail(),
      },
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
          fontFamily: 'IPix',
          backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
          primaryColor: Color.fromRGBO(244, 176, 22, 1.0),
          cardColor: Color.fromRGBO(40, 44, 82, 1.0),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Color.fromRGBO(190, 193, 215, 1.0)),
          textTheme: const TextTheme(
            headline2: TextStyle(
              color: Color.fromRGBO(244, 176, 22, 1.0),
              fontSize: 19,
              fontWeight: FontWeight.w500,
              wordSpacing: 10,
            ),
            // card name
            headline4: TextStyle(
              color: Color.fromRGBO(190, 193, 215, 1.0),
              fontSize: 12,
            ),
            headline5: TextStyle(
                color: Color.fromRGBO(190, 193, 215, 1.0), fontSize: 10),
            headline6: TextStyle(
              color: Color.fromRGBO(244, 176, 22, 1.0),
              fontSize: 12,
            ),
          )),
    );
  }
}
