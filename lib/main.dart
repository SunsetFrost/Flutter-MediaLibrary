import 'package:flutter/material.dart';

import 'package:pokemon/routes.dart';
// import 'package:pokemon/model/Pokemon.dart';
// import 'package:pokemon/list.dart';
// import 'package:pokemon/sword_paint.dart';
// import 'package:pokemon/net/pokemon_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
