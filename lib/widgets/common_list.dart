import 'package:flutter/material.dart';

class CommonList extends StatefulWidget {
  const CommonList({
    Key? key,
    required this.items,
    required this.fetchRecommandList,
    required this.fetchSearchList,
    required this.cardBuilder,
    this.showSearchForm = true,
    this.color = const Color(0xFF3F3F3F),
  });

  final List<dynamic> items;
  final VoidCallback fetchRecommandList;
  final void Function(String searchText) fetchSearchList;
  final Widget Function(BuildContext context, int index) cardBuilder;
  final bool showSearchForm;
  final Color color;

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
      /// isn't null, fetch search items
      if (searchText == '') {
        widget.fetchRecommandList();
      } else {
        widget.fetchSearchList(searchText);
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _onSearchCallback(String? query) {
    setState(() {
      searchText = query!;
    });
    if (query == '') {
      widget.fetchRecommandList();
    } else {
      widget.fetchSearchList(query!);
    }
    _scrollToTop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.showSearchForm
            ? CommonSearch(
                color: widget.color,
                searchCallback: _onSearchCallback,
              )
            : SizedBox(
                height: 10,
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

class CommonSearch extends StatefulWidget {
  const CommonSearch(
      {Key? key, required this.color, required this.searchCallback})
      : super(key: key);

  final Function(String?) searchCallback;
  final Color color;

  @override
  State<CommonSearch> createState() => _CommonSearchState();
}

class _CommonSearchState extends State<CommonSearch> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 16.0),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white,
                style: TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
                decoration: InputDecoration(
                  hintText: '请输入搜索内容',
                  hintStyle:
                      TextStyle(color: Color(0xff9ca3af), fontSize: 14.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16))),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                  filled: true,
                  fillColor: widget.color,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xffe5e7eb),
                  ),
                ),
                // validator: (String? value) {
                //   if (value == null || value.isEmpty) {
                //     return '请输入名称';
                //   }
                //   return null;
                // },
                onSaved: (String? value) {
                  widget.searchCallback(value);
                },
                onEditingComplete: () {
                  _formKey.currentState!.save();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
