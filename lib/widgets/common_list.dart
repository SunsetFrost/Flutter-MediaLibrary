import 'package:flutter/material.dart';

import 'package:media_library/model/Card.dart';
import 'package:flutter/widgets.dart';

class CommonList extends StatefulWidget {
  const CommonList({
    Key? key,
    required this.items,
    required this.fetchList,
    required this.searchList,
    required this.cardBuilder,
  });

  final List<dynamic> items;
  final VoidCallback fetchList;
  final VoidCallback searchList;
  final Widget Function(BuildContext context, int index) cardBuilder;

  @override
  _CommonListState createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  late ScrollController _scrollController;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (_isBottom) {
      /// search text is null, fetch popular movies
      /// isn't null, fetch search movies
      if (searchText == '') {
        widget.fetchList();
      } else {
        widget.searchList();
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

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
          child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20.0,
              childAspectRatio: 0.55,
            ),
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return widget.cardBuilder(context, index);
            },
          ),
        ),
      ],
    );
  }
}

class CommonSearch extends StatelessWidget {
  const CommonSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('search'),
    );
  }
}
