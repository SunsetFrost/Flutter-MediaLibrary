import 'package:flutter/material.dart';

import 'package:pokemon/widgets/library_card.dart';

class Library extends StatelessWidget {
  Library({Key? key}) : super(key: key);

  static const List<String> mockVideos = ['电影库', '动漫库'];
  static const List<String> mockGames = ['神奇宝贝库', '命运之夜库'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              '视频库',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockVideos.length,
              itemBuilder: (BuildContext context, int index) {
                return LibraryCard(
                  name: mockVideos[index],
                  color: Colors.blueAccent,
                  width: 220.0,
                  height: 120.0,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '游戏库',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockGames.length,
              itemBuilder: (BuildContext context, int index) {
                return LibraryCard(
                  name: mockGames[index],
                  color: Colors.orangeAccent,
                  width: 220.0,
                  height: 120.0,
                  path: '/pokemon',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
