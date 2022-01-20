import 'package:media_library/model/Card.dart';
import 'package:flutter/widgets.dart';

class CommonList extends StatefulWidget {
  const CommonList({Key? key, required this.data, required this.card})
      : super(key: key);

  final List<Card> data;
  final Widget card;
  // final Function<>

  @override
  _CommonListState createState() => _CommonListState();
}

class _CommonListState extends State<CommonList> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
