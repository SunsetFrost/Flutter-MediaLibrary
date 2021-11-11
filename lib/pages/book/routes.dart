import 'package:media_library/model/BookInfo.dart';

const String listRoute = '/book';
const String detailRoute = '/book/detail';

class DetailArguments {
  final BookInfo book;

  DetailArguments(this.book);
}
