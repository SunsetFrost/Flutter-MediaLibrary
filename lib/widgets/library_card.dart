import 'package:flutter/material.dart';

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    Key? key,
    required this.name,
    this.path = '',
    this.color = Colors.blueAccent,
    this.width = 130,
    this.height = 180,
  }) : super(key: key);

  final String name;
  final String path;
  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (path != '') {
            Navigator.of(context).pushNamed(path);
          }
        },
        child: Container(
          width: width,
          height: height,
          child: Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Center(
              child: Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
