import 'package:flutter/material.dart';

import 'package:pokemon/widgets/library_card.dart';

class Favor extends StatelessWidget {
  Favor({Key? key}) : super(key: key);

  static const List<String> mockVideoCard = [
    '电影1',
    '电影2',
    '电影3',
    '电影4',
    '电影5',
  ];
  static const List<String> mockMusicCard = [
    '歌曲1',
    '歌曲2',
    '歌曲3',
    '歌曲4',
    '歌曲5',
  ];
  static const List<String> mockBookCard = [
    '书籍1',
    '书籍2',
    '书籍3',
    '书籍4',
    '书籍5',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 160.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockVideoCard.length,
            itemBuilder: (BuildContext context, int index) {
              return LibraryCard(
                name: mockVideoCard[index],
                color: Color(0xff6bd3e0),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            '最近收藏的音乐',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          height: 160.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockMusicCard.length,
            itemBuilder: (BuildContext context, int index) {
              return LibraryCard(
                name: mockMusicCard[index],
                color: Color(0xffe3e6e4),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            '最近收藏的书籍',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Container(
          height: 160.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mockBookCard.length,
            itemBuilder: (BuildContext context, int index) {
              return LibraryCard(
                name: mockBookCard[index],
                color: Color(0xffd6c5ad),
              );
            },
          ),
        ),
      ],
    );
  }
}
