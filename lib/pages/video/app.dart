import 'package:flutter/material.dart';

import 'package:media_library/pages/video/list.dart';
import 'package:media_library/pages/video/detail.dart';
import 'package:media_library/pages/video/player.dart';
import 'package:media_library/pages/video/routes.dart';

class VideoApp extends StatelessWidget {
  const VideoApp({Key? key, required this.defaultRoute}) : super(key: key);

  final RouteSettings defaultRoute;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/') {
          settings = defaultRoute;
        }
        final routes = <String, WidgetBuilder>{
          listRoute: (context) => VideoList(),
          detailRoute: (context) =>
              VideoDetail(args: settings.arguments as DetailArguments),
          playerRoute: (context) => Player(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
      theme: ThemeData(
          // scaffoldBackgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
          ),
    );
  }
}
