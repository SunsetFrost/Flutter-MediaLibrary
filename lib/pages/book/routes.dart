import 'package:book_api/book_api.dart';

const String listRoute = '/book/list';
const String detailRoute = '/book/detail';
const String readerRoute = '/book/reader';

class DetailArguments {
  final BookInfo book;

  DetailArguments(this.book);
}
