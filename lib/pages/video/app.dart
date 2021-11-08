import 'package:flutter/material.dart';

import 'package:pokemon/pages/video/list.dart';
import 'package:pokemon/pages/video/detail.dart';
import 'package:pokemon/pages/video/player.dart';
import 'package:pokemon/pages/video/routes.dart' as routes;

class VideoApp extends StatelessWidget {
  const VideoApp({Key? key}) : super(key: key);

  static const String listRoute = routes.listRoute;
  static const String detailRoute = routes.detailRoute;
  static const String playerRoute = routes.playerRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      routes: <String, WidgetBuilder>{
        listRoute: (context) => VideoList(),
        detailRoute: (context) => VideoDetail(),
        playerRoute: (context) => Player(),
      },
      theme: ThemeData(
          // scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
          ),
    );
  }
}
