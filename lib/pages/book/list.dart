import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:media_library/bloc/list_bloc.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/widgets/common_list.dart';
import 'package:media_library/widgets/common_card.dart';
import 'package:media_library/pages/book/routes.dart' as routes;

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListBloc(
          libraryRepository:
              LibraryRepository(baseUrl: backendURI, type: APIType.book))
        ..add(FetchRecommandList()),
      child: Scaffold(body: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          final items = context.read<ListBloc>().state.items;
          return BookGrid(
            items: items,
          );
        },
      )),
    );
  }
}

class BookGrid extends StatelessWidget {
  const BookGrid({Key? key, required this.items}) : super(key: key);

  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: CommonList(
        items: items,
        fetchList: () {
          context.read<ListBloc>().add(FetchRecommandList());
        },
        searchList: () {
          context.read<ListBloc>().add(FetchSearchList('harry'));
        },
        cardBuilder: (context, index) {
          return CommonCard(
            name: items[index].volumeInfo.title,
            imagePath:
                backendURI + items[index].volumeInfo.imageLinks.proxyThumbnail,
            aspect: 1.3,
          );
        },
      ),
    );
  }
}

// class BookGrid extends StatelessWidget {
//   const BookGrid({Key? key, required this.books}) : super(key: key);

//   final List<BookInfo> books;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 20,
//           mainAxisSpacing: 10,
//           childAspectRatio: 0.5,
//         ),
//         itemCount: books.length,
//         itemBuilder: (context, index) {
//           return Column(
//             children: [
//               CommonCard(
//                 name: books[index].volumeInfo.title,
//                 imagePath: BookData.getBookImagePath(
//                     books[index].volumeInfo.imageLinks.smallThumbnail),
//                 aspect: 1.3,
//                 onClick: () => {
//                   Navigator.of(context).pushNamed(routes.detailRoute,
//                       arguments: routes.DetailArguments(books[index])),
//                 },
//               )
//             ],
//           );
//         });
//   }
// }
