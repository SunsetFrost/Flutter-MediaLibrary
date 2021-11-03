import 'package:flutter/material.dart';

import 'package:pokemon/widgets/library_card.dart';

class Library extends StatelessWidget {
  Library({Key? key}) : super(key: key);

  static const List<String> mockVideos = ['视频库', '音乐库', '书库'];
  static const List<String> mockGames = ['口袋妖怪'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: double.infinity,
          height: 300.0,
          color: Color(0xFF66CCFF),
          child: Center(
            child: Text('repo widget'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            '书影音',
            style: Theme.of(context).textTheme.headline2,
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
                path: '/video',
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            '资料库',
            style: Theme.of(context).textTheme.headline2,
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
    );
  }
}
