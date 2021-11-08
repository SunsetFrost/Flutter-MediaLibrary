import 'package:flutter/material.dart';

import 'package:pokemon/widgets/library_card.dart';

Map<String, LibraryCard> libraryCards = {
  '视频库': LibraryCard(
    name: '视频库',
    color: Colors.blueAccent,
    width: 220.0,
    height: 120.0,
    path: '/video',
  ),
  '音乐库': LibraryCard(
    name: '音乐库',
  ),
  '书库': LibraryCard(
    name: '书库',
    color: Colors.amber,
    width: 220.0,
    height: 120.0,
    path: '/book',
  ),
};

Map<String, LibraryCard> dataSourceCards = {
  '口袋妖怪': LibraryCard(
    name: '口袋妖怪',
    color: Colors.orangeAccent,
    width: 220.0,
    height: 120.0,
    path: '/pokemon',
  ),
};

class Library extends StatelessWidget {
  Library({Key? key}) : super(key: key);

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
            itemCount: libraryCards.values.length,
            itemBuilder: (BuildContext context, int index) {
              return libraryCards.values.toList()[index];
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
            itemCount: dataSourceCards.length,
            itemBuilder: (BuildContext context, int index) {
              return dataSourceCards.values.toList()[index];
            },
          ),
        ),
      ],
    );
  }
}
