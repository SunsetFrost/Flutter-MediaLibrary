import 'package:media_library/model/BookInfo.dart';

const String listRoute = '/book';
const String detailRoute = '/book/detail';
const String readerRoute = '/book/reader';

class DetailArguments {
  final BookInfo book;

  DetailArguments(this.book);
}
