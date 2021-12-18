import 'package:flutter/material.dart';

import 'package:media_library/pages/navigate_page.dart';
import 'package:media_library/pages/pokemon/routes.dart' as pokemon_routes;
import 'package:media_library/pages/video/list.dart';
import 'package:media_library/pages/video/detail.dart';
import 'package:media_library/pages/video/routes.dart' as video_routes;
import 'package:media_library/pages/book/routes.dart' as book_routes;
import 'package:media_library/pages/music/routes.dart' as music_routes;

typedef PathWidgetBuilder = Widget Function(BuildContext, RouteSettings);

class Path {
  const Path(this.pattern, this.builder);

  final String pattern;

  final PathWidgetBuilder builder;
}

class RouteConfiguration {
  static List<Path> paths = [
    // pokemon
    // Path(
    //   r'^' + pokemon_routes.listRoute,
    //   (context, match) => ChildAppWrapper(childApp: pokemon_app.PokemonApp()),
    // ),
    // video
    Path(
      r'^' + video_routes.listRoute,
      (context, settings) => VideoListPage(),
    ),
    Path(
      r'^' + video_routes.detailRoute,
      (context, settings) =>
          VideoDetail(args: settings.arguments as video_routes.DetailArguments),
    ),
    // book
    // Path(
    //   r'^' + book_routes.listRoute,
    //   (context, match) => ChildAppWrapper(childApp: book_app.BookApp()),
    // ),
    // // music
    // Path(
    //   r'^' + music_routes.listRoute,
    //   (context, match) => ChildAppWrapper(childApp: music_app.MusicApp()),
    // ),
    // home
    Path(r'^/', (context, match) => NavigatePage()),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String name = settings.name!;
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(name)) {
        return MaterialPageRoute<void>(
          builder: (context) => path.builder(context, settings),
          settings: settings,
        );
      }
    }

    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        body: Center(
          child: Text('路径错误'),
        ),
      ),
    );
  }
}
