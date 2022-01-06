import 'package:media_library/net/api.dart';
import 'package:media_library/model/BookInfo.dart';

class BookData {
  static Future<List<BookInfo>> getBookList({page = 1}) async {
    final url = '/book/best-sellers';

    final response = await httpManager.fetch(url);

    final bookList =
        response.map<BookInfo>((json) => BookInfo.fromJson(json)).toList();

    return bookList;
  }
}
