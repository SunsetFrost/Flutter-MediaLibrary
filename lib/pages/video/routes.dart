const String routePrefix = '/video';
const String listRoute = '/video/list';
const String detailRoute = '/video/detail';
const String playerRoute = '/video/player';

class DetailArguments {
  final int id;
  final String imagePath;

  DetailArguments(this.id, this.imagePath);
}

// class VideoRoute extends StatefulWidget {
//   const VideoRoute({Key? key, required this.setupPageRoute}) : super(key: key);

//   final RouteSettings? setupPageRoute;

//   @override
//   _VideoRouteState createState() => _VideoRouteState();
// }

// class _VideoRouteState extends State<VideoRoute> {
//   final _navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Navigator(
//         key: _navigatorKey,
//         onGenerateRoute: _onGernerateRoute,
//       ),
//     );
//   }

//   Route _onGernerateRoute(RouteSettings settings) {
//     late Widget page;
//     switch (settings.name) {
//       case listRoute:
//         page = VideoListPage();
//         break;
//       case detailRoute:
//         page = VideoDetail(args: settings.arguments as DetailArguments);
//         break;
//     }

//     return MaterialPageRoute(
//       builder: (context) {
//         return page;
//       },
//       settings: settings,
//     );
//   }
// }
