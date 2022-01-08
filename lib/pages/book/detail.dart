import 'package:flutter/material.dart';
// import 'package:epub_viewer/epub_viewer.dart';

import 'package:media_library/net/book_data.dart';
import 'package:media_library/pages/book/routes.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key, required this.args}) : super(key: key);

  final DetailArguments args;

  void openEpubBook(BuildContext context) {
    // EpubViewer.setConfig(
    //   themeColor: Theme.of(context).primaryColor,
    //   identifier: "iosBook",
    //   scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
    //   allowSharing: true,
    //   enableTts: true,
    //   nightMode: true,
    // );

    // EpubViewer.openAsset(
    //     'assets/book/Jue Ji _ Yong Sheng Zhi Hai . Di Er Juan - Guo Jing Ming.epub');
  }

  @override
  Widget build(BuildContext context) {
    final book = args.book;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(BookData.getBookImagePath(
                    book.volumeInfo.imageLinks.smallThumbnail)),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.7),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    child: Icon(Icons.chevron_left),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(primary: Colors.white),
                  ),
                ),
                Container(
                  width: 300,
                  height: 300,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.center,
                  // decoration: BoxDecoration(
                  //   // image: DecorationImage(
                  //   //   image: NetworkImage(
                  //   //     VideoData.getImagePath(relativePath: video.posterPath),
                  //   //   ),

                  //   // ),
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      BookData.getBookImagePath(
                          book.volumeInfo.imageLinks.smallThumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  book.volumeInfo.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  book.volumeInfo.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(readerRoute,
                    //     arguments: DetailArguments(book));
                    openEpubBook(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.play_arrow), Text('阅读')],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 30),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
