import 'package:flutter/material.dart';

import 'package:media_library/widgets/library_card.dart';

Map<String, LibraryCard> libraryCards = {
  '视频库': LibraryCard(
    name: '视频库',
    color: Color(0xff6bd3e0),
    width: 220.0,
    height: 120.0,
    path: '/video',
  ),
  '音乐库': LibraryCard(
    name: '音乐库',
    color: Color(0xffe3e6e4),
    width: 220.0,
    height: 120.0,
    path: '/music',
  ),
  '书库': LibraryCard(
    name: '书库',
    color: Color(0xffd6c5ad),
    width: 220.0,
    height: 120.0,
    path: '/book',
  ),
};

Map<String, LibraryCard> dataSourceCards = {
  '口袋妖怪': LibraryCard(
    name: '口袋妖怪',
    color: Color.fromRGBO(244, 176, 22, 1.0),
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
          decoration: BoxDecoration(
            color: Color(0xFF66CCFF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'repo widget',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
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
