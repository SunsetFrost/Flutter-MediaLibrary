import 'package:flutter/material.dart';

import 'package:pokemon/pages/book/list.dart';
import 'package:pokemon/pages/book/detail.dart';
import 'package:pokemon/pages/book/routes.dart' as routes;

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  static const String listRoute = routes.listRoute;
  static const String detailRoute = routes.detailRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      routes: <String, WidgetBuilder>{
        listRoute: (context) => BookList(),
        detailRoute: (context) => BookDetail(),
      },
    );
  }
}
