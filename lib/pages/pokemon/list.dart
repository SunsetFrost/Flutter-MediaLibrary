import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/bloc/list_bloc.dart';
import 'package:media_library/widgets/common_list.dart';
import 'package:media_library/pages/pokemon/card.dart';
import 'package:media_library/pages/pokemon/app.dart';

class PokemonList extends StatelessWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 35, 64, 1.0),
      body: PokemonTheme(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 12,
                bottom: 20,
              ),
              child: Text(
                '口袋图鉴',
                style: TextStyle(
                  color: Color.fromRGBO(244, 176, 22, 1.0),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 10,
                ),
              ),
            ),
            Expanded(
              child: PokemonGrid(),
            ),
          ],
        ),
      ),
    );
  }
}

// // 口袋妖怪网格组件
// class PokemonGrid extends StatelessWidget {
//   const PokemonGrid({Key? key, required this.pokemons}) : super(key: key);

//   final List<Pokemon> pokemons;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: EdgeInsets.all(4),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         crossAxisSpacing: 20,
//         mainAxisSpacing: 10,
//         childAspectRatio: 0.6,
//       ),
//       itemCount: pokemons.length,
//       itemBuilder: (context, index) {
//         return PokemonCard(
//           pokemon: pokemons[index],
//         );
//       },
//     );
//   }
// }

// // 搜索组件
// class SearchWidget extends StatelessWidget {
//   const SearchWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         child: Column(
//       children: <Widget>[
//         TextFormField(
//           decoration: InputDecoration(
//               contentPadding: EdgeInsets.all(0),
//               hintText: '请输入搜索的口袋妖怪',
//               hintStyle: TextStyle(color: Colors.white54, fontSize: 14),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                   width: 0,
//                   style: BorderStyle.none,
//                 ),
//               ),
//               fillColor: Colors.white12,
//               filled: true,
//               prefixIcon: Icon(
//                 Icons.search,
//                 size: 24,
//                 color: Colors.white54,
//               )),
//         )
//       ],
//     ));
//   }
// }

// /*
//   filter组件
// */
// class FilterWidget extends StatefulWidget {
//   const FilterWidget({Key? key}) : super(key: key);

//   @override
//   _FilterWidgetState createState() => _FilterWidgetState();
// }

// class _FilterWidgetState extends State<FilterWidget> {
//   bool _isPanelVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     final _buttonStyle = TextButton.styleFrom(
//       primary: Colors.white54,
//       // alignment: Alignment.centerLeft,
//       textStyle: const TextStyle(
//         fontSize: 14,
//         fontFamily: 'IPix',
//       ),
//     );
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               style: _buttonStyle,
//               onPressed: () {
//                 setState(() {
//                   _isPanelVisible = !_isPanelVisible;
//                 });
//               },
//               child: const Text('属性'),
//             ),
//             TextButton(
//               style: _buttonStyle,
//               onPressed: () {
//                 setState(() {
//                   _isPanelVisible = !_isPanelVisible;
//                 });
//               },
//               child: const Text('类别'),
//             ),
//             TextButton(
//               style: _buttonStyle,
//               onPressed: () {
//                 setState(() {
//                   _isPanelVisible = !_isPanelVisible;
//                 });
//               },
//               child: Row(
//                 children: <Widget>[Text('种族值'), Icon(Icons.arrow_drop_down)],
//               ),
//             ),
//           ],
//         ),
//         Visibility(
//             visible: _isPanelVisible,
//             child: Container(
//               width: double.infinity,
//               height: 100,
//               decoration: BoxDecoration(
//                   color: Theme.of(context).cardColor,
//                   borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.symmetric(horizontal: 4),
//             ))
//       ],
//     );
//   }
// }

class PokemonGrid extends StatelessWidget {
  const PokemonGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ListBloc(
          libraryRepository:
              LibraryRepository(baseUrl: backendURI, type: APIType.pokemon),
        )..add(FetchRecommandList());
      },
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, snapshot) {
          final items = context.read<ListBloc>().state.items;
          return CommonList(
            items: items,
            color: Color.fromRGBO(40, 44, 82, 1.0),
            fetchRecommandList: () {
              context.read<ListBloc>().add(FetchRecommandList());
            },
            fetchSearchList: (searchText) {
              context.read<ListBloc>().add(FetchSearchList(searchText));
            },
            cardBuilder: (context, index) {
              final pokemon = items[index] as Pokemon;
              return PokemonCard(pokemon: pokemon);
            },
          );
        },
      ),
    );
  }
}
