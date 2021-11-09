import 'package:flutter/material.dart';

import 'package:media_library/pages/music/list.dart';
import 'package:media_library/pages/music/detail.dart';
import 'package:media_library/pages/music/routes.dart' as routes;

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  static const String listRoute = routes.listRoute;
  static const String detailRoute = routes.detailRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      routes: <String, WidgetBuilder>{
        listRoute: (context) => MusicList(),
      },
    );
  }
}
