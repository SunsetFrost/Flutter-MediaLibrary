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
        backgroundColor: Color(0xFFF1F2F6),
        primaryColor: Color(0xFF202736),
        textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202736),
            ),
            headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color(0xff455a64),
            )),
      ),
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
