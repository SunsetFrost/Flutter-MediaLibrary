import 'package:flutter/material.dart';

import 'package:library_repository/library_repository.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/widgets/common_card.dart';
import 'package:media_library/pages/video/routes.dart' as video_routes;
import 'package:media_library/pages/music/routes.dart' as music_routes;
import 'package:media_library/pages/book/routes.dart' as book_routes;

class Favor extends StatefulWidget {
  Favor({Key? key}) : super(key: key);

  @override
  State<Favor> createState() => _FavorState();
}

class _FavorState extends State<Favor> {
  late List<Video> videos;
  late List<Album> musics;
  late List<BookInfo> books;

  @override
  void initState() {
    videos = GlobleCacheData.favorVideos;
    musics = GlobleCacheData.favorMusics;
    books = GlobleCacheData.favorBooks;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 16.0,
          left: 12.0,
          right: 12.0,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Theme.of(context).backgroundColor,
              Color(0xFFD5DFFC)
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '最近收藏的视频',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              height: 230.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: CommonCard(
                      name: videos[index].title,
                      imagePath: videos[index].posterPath,
                      aspect: 1.4,
                      textColor: Colors.black54,
                      onClick: () => {
                        Navigator.of(context)
                            .pushNamed(video_routes.detailRoute,
                                arguments: video_routes.DetailArguments(
                                  videos[index].id,
                                  videos[index].posterPath,
                                )),
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '最近收藏的音乐',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              height: 220.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: musics.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: CommonCard(
                      name: musics[index].name,
                      imagePath: musics[index].images[1].url,
                      // aspect: 0.9,
                      textColor: Colors.black54,
                      onClick: () => {
                        Navigator.of(context).pushNamed(
                            music_routes.detailRoute,
                            arguments:
                                music_routes.DetailArguments(musics[index])),
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '最近收藏的书籍',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Container(
              height: 230.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: CommonCard(
                      name: books[index].volumeInfo.title,
                      imagePath:
                          books[index].volumeInfo.imageLinks.smallThumbnail,
                      aspect: 1.3,
                      textColor: Colors.black54,
                      onClick: () => {
                        Navigator.of(context).pushNamed(book_routes.detailRoute,
                            arguments:
                                book_routes.DetailArguments(books[index])),
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
