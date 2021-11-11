import 'package:flutter/material.dart';

import 'package:media_library/widgets/sword_paint.dart';
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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(routes.detailRoute,
                  arguments: routes.DetailArguments(books[index]));
            },
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * 1.3,
                    margin: EdgeInsets.only(bottom: 6.0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(books[index]
                              .volumeInfo
                              .imageLinks
                              .smallThumbnail),
                          fit: BoxFit.fill),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(16.0, 20.0)),
                    )),
                Text(
                  books[index].volumeInfo.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
