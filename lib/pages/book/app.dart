import 'package:flutter/material.dart';

import 'package:media_library/pages/book/list.dart';
import 'package:media_library/pages/book/detail.dart';
import 'package:media_library/pages/book/routes.dart';

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      onGenerateRoute: (RouteSettings settings) {
        final routes = <String, WidgetBuilder>{
          listRoute: (context) => BookList(),
          detailRoute: (context) =>
              BookDetail(args: settings.arguments as DetailArguments),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
