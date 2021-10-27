import 'package:flutter/material.dart';

import 'package:pokemon/widgets/library_card.dart';

class Favor extends StatelessWidget {
  Favor({Key? key}) : super(key: key);

  static const List<String> mockCard = [
    '电影1',
    '电影2',
    '电影3',
    '电影4',
    '电影5',
  ];

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
              '最近收藏的电影',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockCard.length,
              itemBuilder: (BuildContext context, int index) {
                return LibraryCard(
                  name: mockCard[index],
                  color: Colors.orangeAccent,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '最近收藏的动漫',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockCard.length,
              itemBuilder: (BuildContext context, int index) {
                return LibraryCard(
                  name: mockCard[index],
                  color: Colors.redAccent,
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              '最近喜爱的神奇宝贝',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Container(
            height: 160.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockCard.length,
              itemBuilder: (BuildContext context, int index) {
                return LibraryCard(
                  name: mockCard[index],
                  color: Colors.greenAccent,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
