import 'package:flutter/material.dart';

import 'package:pokemon/pages/navigate_page.dart';
import 'package:pokemon/pages/library.dart';
import 'package:pokemon/pages/mine.dart';
import 'package:pokemon/pages/pokemon/app.dart' as pokemon_app;
import 'package:pokemon/pages/pokemon/routes.dart' as pokemon_routes;

typedef PathWidgetBuilder = Widget Function(BuildContext, String);

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    Path(
      r'^' + pokemon_routes.listRoute,
      (context, match) => ChildAppWrapper(childApp: pokemon_app.PokemonApp()),
    ),
    Path(r'^/', (context, match) => NavigatePage())
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String name = settings.name!;
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(name)) {
        // final firstMatch = regExpPattern.firstMatch(name);
        // final match =
        //     (firstMatch?.groupCount == 1) ? firstMatch?.group(1) : null;

        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, name),
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
        builder: (BuildContext context) => Scaffold(
              body: Center(
                child: Text('路径错误'),
              ),
            ));
  }
}
