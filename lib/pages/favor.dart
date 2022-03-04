import 'package:flutter/material.dart';

import 'package:library_repository/library_repository.dart';
import 'package:media_library/utils/cache_data.dart';
import 'package:media_library/widgets/common_card.dart';
import 'package:media_library/pages/video/routes.dart' as routes;

class Favor extends StatefulWidget {
  Favor({Key? key}) : super(key: key);

  @override
  State<Favor> createState() => _FavorState();
}

class _FavorState extends State<Favor> {
  late List<Video> videos;

  @override
  void initState() {
    videos = GlobleCacheData.favorVideos;
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
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videos.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: CommonCard(
                      name: videos[index].title,
                      imagePath: videos[index].posterPath,
                      onClick: () => {
                        Navigator.of(context).pushNamed(routes.detailRoute,
                            arguments:
                                routes.DetailArguments(videos[index].id)),
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
