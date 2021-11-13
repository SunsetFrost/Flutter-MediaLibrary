import 'package:flutter/material.dart';

import 'package:media_library/routes.dart';
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
        backgroundColor: Color(0xFFEFF1F6),
        primaryColor: Color(0xFF202736),
        secondaryHeaderColor: Color(0xff718792),
        cardColor: Color(0xff455a64),
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
            ),
            subtitle2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xff718792),
            )),
      ),
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
