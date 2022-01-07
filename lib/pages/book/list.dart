import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
import 'package:media_library/widgets/common_card.dart';

import 'package:media_library/model/BookInfo.dart';
import 'package:media_library/net/book_data.dart';
import 'package:media_library/pages/book/routes.dart' as routes;

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<BookInfo>>(
          future: BookData.getBookList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BookGrid(books: snapshot.data!);
            } else if (snapshot.hasError) {
              return Icon(Icons.error);
            }
            return const Center(
              child: SwordLoading(
                loadColor: Colors.white,
                size: 60,
              ),
            );
          },
        ),
      ),
    );
  }
}

class BookGrid extends StatelessWidget {
  const BookGrid({Key? key, required this.books}) : super(key: key);

  final List<BookInfo> books;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 0.5,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          print(books[index]);
          return Column(
            children: [
              CommonCard(
                name: books[index].volumeInfo.title,
                imagePath: BookData.getBookImagePath(
                    books[index].volumeInfo.imageLinks.smallThumbnail),
                aspect: 1.3,
                onClick: () => {
                  Navigator.of(context).pushNamed(routes.detailRoute,
                      arguments: routes.DetailArguments(books[index])),
                },
              )
            ],
          );
        });
  }
}
