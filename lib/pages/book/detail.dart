import 'package:flutter/material.dart';

import 'package:media_library/pages/book/routes.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;
    final book = args.book;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(book.volumeInfo.imageLinks.thumbnail),
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
                  width: 250,
                  height: 300,
                  margin: EdgeInsets.symmetric(vertical: 30),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //     VideoData.getImagePath(relativePath: video.posterPath),
                    //   ),

                    // ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      book.volumeInfo.imageLinks.smallThumbnail,
                      fit: BoxFit.contain,
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
                    // Navigator.of(context).pushNamed(playerRoute);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Icon(Icons.play_arrow), Text('阅读')],
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 30),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
