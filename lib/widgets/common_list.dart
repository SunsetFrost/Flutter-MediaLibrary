import 'package:flutter/material.dart';

import 'package:media_library/model/Card.dart';
import 'package:flutter/widgets.dart';

class CommonList extends StatefulWidget {
  const CommonList(
      {Key? key,
      required this.items,
      required this.fetchList,
      required this.searchList})
      : super(key: key);

  final List<dynamic> items;
  final VoidCallback fetchList;
  final VoidCallback searchList;

  @override
  _CommonListState createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: widget.fetchList,
              child: Text('Fetch Items'),
            ),
            ElevatedButton(
              onPressed: widget.searchList,
              child: Text('Search Items'),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              if (widget.items.isEmpty) {
                return Center(child: Text('暂无数据'));
              }
              return ListTile(
                title: Text(widget.items[index].id.toString()),
              );
            },
          ),
        ),
      ],
    );
  }
}
