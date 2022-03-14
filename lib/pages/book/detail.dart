import 'package:flutter/material.dart';
// import 'package:epub_viewer/epub_viewer.dart';
import 'package:library_repository/library_repository.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/pages/book/routes.dart';

class BookDetail extends StatefulWidget {
  BookDetail({Key? key, required this.args})
      : _repo = LibraryRepository(baseUrl: backendURI, type: APIType.book),
        super(key: key);

  final DetailArguments args;
  final LibraryRepository _repo;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool _isFavored = false;

  @override
  void initState() {
    GlobleCacheData.favorBooks.forEach((element) {
      if (element.id == widget.args.book.id) {
        _isFavored = true;
      }
    });

    super.initState();
  }

  // TODO open book function
  void openEpubBook(BuildContext context) {
    print('open book invoke');
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

  void onFavorClick() {
    if (_isFavored) {
      // cancel favor
      GlobleCacheData.favorBooks
          .removeWhere((element) => element.id == widget.args.book.id);
    } else {
      // add favor
      GlobleCacheData.favorBooks.add(widget.args.book);
    }
    GlobleCacheData.saveBooks();
    setState(() {
      _isFavored = !_isFavored;
    });
    print(GlobleCacheData.favorBooks);
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.args.book;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.volumeInfo.imageLinks.smallThumbnail),
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
                  width: 128,
                  height: 206,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          book.volumeInfo.imageLinks.smallThumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          child: Icon(Icons.favorite),
                          onPressed: onFavorClick,
                          style: TextButton.styleFrom(
                              primary: _isFavored ? Colors.red : Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 80.0,
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
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          book.volumeInfo.averageRating.toString(),
                          style: _getInlineTextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          book.volumeInfo.authors![0].toString(),
                          style: _getInlineTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.pages,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          book.volumeInfo.pageCount.toString(),
                          style: _getInlineTextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Text(
                          book.volumeInfo.language!,
                          style: _getInlineTextStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  book.volumeInfo.description!,
                  textAlign: TextAlign.left,
                  style: _getInlineTextStyle(),
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

TextStyle _getInlineTextStyle() => TextStyle(
      color: Colors.grey[350],
      fontSize: 14,
    );
