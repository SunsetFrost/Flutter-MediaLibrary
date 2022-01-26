import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:media_library/constants.dart';
import 'package:media_library/widgets/library_card.dart';
import 'package:media_library/pages/video/routes.dart' as video_routes;
import 'package:media_library/pages/music/routes.dart' as music_routes;
import 'package:media_library/pages/book/routes.dart' as book_routes;
import 'package:media_library/pages/pokemon/routes.dart' as pokemon_routes;

Map<String, LibraryCard> libraryCards = {
  '电影库': LibraryCard(
    name: '电影库',
    desc: 'The Movie DataBase',
    color: Color(0xFFEFB36A),
    colorDark: Color(0xff30a1ae),
    colorLight: Color(0xFFFDF7EE),
    path: video_routes.listRoute,
    iconType: Icons.video_label,
  ),
  '音乐库': LibraryCard(
    name: '音乐库',
    desc: 'Spotify',
    color: Color(0xFF858A97),
    colorDark: Color(0xffb1b4b2),
    colorLight: Color(0xFFF2F3F4),
    path: music_routes.listRoute,
    iconType: Icons.music_video,
  ),
  '书库': LibraryCard(
    name: '书库',
    desc: 'Google Book API',
    color: Color(0xFF66B7D9),
    colorDark: Color(0xffa4957e),
    colorLight: Color(0xFFECF7FA),
    path: book_routes.listRoute,
    iconType: Icons.book,
  ),
};

Map<String, LibraryCard> dataSourceCards = {
  '口袋妖怪': LibraryCard(
    name: '口袋妖怪',
    desc: 'Poke API',
    color: Color(0xFFEFB36A),
    colorDark: Color(0xff30a1ae),
    colorLight: Color(0xFFFDF7EE),
    path: pokemon_routes.listRoute,
    iconType: Icons.games,
  ),
};

class Library extends StatelessWidget {
  Library({Key? key}) : super(key: key);

  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
            // header
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sunset Frost',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '管理你的媒体库',
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            ),
            // button group
            Container(
              height: 140.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundButton(
                    icon: Icons.file_upload_rounded,
                    handlePressed: openFilePicker,
                    desc: '新增媒体',
                  ),
                  RoundButton(
                    icon: Icons.folder,
                    handlePressed: openFilePicker,
                    desc: '新增媒体库',
                  ),
                ],
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
              constraints: BoxConstraints(maxHeight: 300.0),
              child: Column(
                children: List.generate(libraryCards.length, (index) {
                  return libraryCards.values.toList()[index];
                }),
              ),

              // ListView.builder(
              //   itemExtent: 80.0,
              //   itemCount: libraryCards.values.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return libraryCards.values.toList()[index];
              //   },
              // ),
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
              child: Column(
                children: List.generate(dataSourceCards.length, (index) {
                  return dataSourceCards.values.toList()[index];
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.handlePressed,
    required this.icon,
    required this.desc,
    this.color = const Color(0xff718792),
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final Function handlePressed;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            shape: CircleBorder(),
            padding: EdgeInsets.all(16.0),
          ),
          child: Icon(
            icon,
            color: color,
          ),
          onPressed: () {
            handlePressed();
          },
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          desc,
          style: TextStyle(
            color: Color(0xff718792),
          ),
        ),
      ],
    );
  }
}
