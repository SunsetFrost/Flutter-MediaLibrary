import 'package:flutter/material.dart';

import 'package:media_library/pages/music/list.dart';
import 'package:media_library/pages/music/detail.dart';
import 'package:media_library/pages/music/routes.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      debugShowCheckedModeBanner: false,
      initialRoute: listRoute,
      onGenerateRoute: (RouteSettings settings) {
        final routes = <String, WidgetBuilder>{
          listRoute: (context) => MusicList(),
          detailRoute: (context) =>
              MusicDetail(args: settings.arguments as DetailArguments),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
