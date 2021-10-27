import 'package:flutter/material.dart';

import 'package:pokemon/pages/favor.dart';
import 'package:pokemon/pages/library.dart';
import 'package:pokemon/pages/mine.dart';

class NavigatePage extends StatefulWidget {
  NavigatePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigatePageState();
  }
}

class _NavigatePageState extends State<NavigatePage> {
  int _selectedIndex = 1;

  List<Widget> pages = [
    Favor(),
    Library(),
    Mine(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '收藏',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: '资料库',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我的',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
