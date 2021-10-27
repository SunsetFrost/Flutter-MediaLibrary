import 'package:flutter/material.dart';

import 'package:pokemon/routes.dart';
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
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          // headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          // bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}



// class HomePage extends StatefulWidget {
//   @override
//   HomePageState createState() {
//     return new HomePageState();
//   }
// }

// class HomePageState extends State<HomePage> {
//   late Future<List<Pokemon>> pokeList;

//   @override
//   void initState() {
//     super.initState();
//     pokeList = PokemonData.getPokemonList();
//   }

//   final List<String> libraryCards = ['电影库', '动漫库', '神奇宝贝库'];
//   final List<String> libraryRoutes = ['', '', ''];

//   final List<String> libraryCards2 = ['电影1', '电影2', '电影3', '电影4', '电影5', '电影6'];
//   final List<String> libraryRoutes2 = ['', '', '', '', '', ''];

//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
//       // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Padding(
//             //   padding: EdgeInsets.only(top: 60, left: 16, bottom: 12),
//             //   child: Text(
//             //     '口袋图鉴',
//             //     style: TextStyle(
//             //       color: Color.fromRGBO(244, 176, 22, 1.0),
//             //       fontSize: 20,
//             //       fontWeight: FontWeight.w500,
//             //       wordSpacing: 10,
//             //     ),
//             //   ),
//             // ),
//             // Expanded(
//             //     child: FutureBuilder<List<Pokemon>>(
//             //         future: pokeList,
//             //         builder: (context, snapshot) {
//             //           if (snapshot.hasData) {
//             //             return PokemonList(pokemons: snapshot.data!);
//             //           } else if (snapshot.hasError) {
//             //             return Text('${snapshot.error}');
//             //           }
//             //           return const Center(
//             //             child: SwordLoading(
//             //               loadColor: Colors.white,
//             //               size: 60,
//             //             ),
//             //           );
//             //         }))
//             Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: Text(
//                 '资料库',
//                 style: Theme.of(context).textTheme.headline1,
//               ),
//             ),
//             Container(
//               height: 120.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: libraryCards.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return LibraryCard(name: libraryCards[index]);
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 '最近收藏的电影',
//                 style: Theme.of(context).textTheme.headline1,
//               ),
//             ),
//             Container(
//               height: 160.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: libraryCards2.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return LibraryCard2(
//                     name: libraryCards2[index],
//                     color: Colors.orangeAccent,
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 '最近收藏的动漫',
//                 style: Theme.of(context).textTheme.headline1,
//               ),
//             ),
//             Container(
//               height: 160.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: libraryCards2.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return LibraryCard2(
//                     name: libraryCards2[index],
//                     color: Colors.redAccent,
//                   );
//                 },
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 '最近喜爱的神奇宝贝',
//                 style: Theme.of(context).textTheme.headline1,
//               ),
//             ),
//             Container(
//               height: 160.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: libraryCards2.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return LibraryCard2(
//                     name: libraryCards2[index],
//                     color: Colors.greenAccent,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
