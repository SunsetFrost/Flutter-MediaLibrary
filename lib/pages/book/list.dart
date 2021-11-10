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
        padding: EdgeInsets.all(4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.of(context).pushNamed(routes.detailRoute,
              //     arguments: routes.DetailArguments(books[index].id));
            },
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3.2,
                    height: MediaQuery.of(context).size.width / 3.2 * 1.2,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      // image: DecorationImage(
                      //     image: NetworkImage(BookData.getImagePath(
                      //         relativePath: videos[index].posterPath)),
                      //     fit: BoxFit.contain),
                    )),
                Text(
                  books[index].id,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
          // Container(
          //   width: MediaQuery.of(context).size.width / 3.8,
          //   color: Colors.blueAccent,
          //   child: Text(index.toString()),
          // );
        });
  }
}
