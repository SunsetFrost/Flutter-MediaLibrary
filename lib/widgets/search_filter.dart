import 'package:flutter/material.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({
    Key? key,
    required this.filterData,
    required this.onFilterSelected,
  }) : super(key: key);

  final Map<String, List<String>> filterData;
  final Function(Map<String, String>) onFilterSelected;

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  bool _isPanelVisible = false;
  String selectedIndex = '';
  Map<String, String> selectedItem = {};

  @override
  Widget build(BuildContext context) {
    final _buttonStyle = TextButton.styleFrom(
      primary: Colors.white54,
      alignment: Alignment.centerLeft,
      // textStyle: const TextStyle(
      //   fontSize: 14,
      //   fontFamily: 'IPix',
      // ),
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.filterData.keys
              .map(
                (i) => new TextButton(
                  style: _buttonStyle,
                  onPressed: () {
                    /// if close filter
                    /// invoke callback
                    if (_isPanelVisible == true) {
                      widget.onFilterSelected(selectedItem);
                    }
                    setState(() {
                      _isPanelVisible = !_isPanelVisible;
                      selectedIndex = i;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Text(i),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        Visibility(
            visible: _isPanelVisible,
            child: Container(
              width: double.infinity,
              // height: 100,
              decoration: BoxDecoration(
                  // color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: selectedIndex != ''
                    ? widget.filterData[selectedIndex]!
                        .map((e) => TextButton(
                            onPressed: () {
                              setState(() {
                                selectedItem[selectedIndex] = e;
                              });
                            },
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.white54),
                            )))
                        .toList()
                    : [],
              ),
            ))
      ],
    );
  }
}
