import 'package:flutter/material.dart';

import 'package:media_library/model/Card.dart';
import 'package:flutter/widgets.dart';

class CommonList extends StatefulWidget {
  const CommonList({Key? key, required this.videos}) : super(key: key);

  final List<dynamic> videos;

  @override
  _CommonListState createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    if (widget.videos.isEmpty) {
      return CircularProgressIndicator();
    }
    return ListView.builder(
        itemCount: widget.videos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(widget.videos[index].title),
            subtitle: Text(widget.videos[index].overview),
          );
        });
  }
}
