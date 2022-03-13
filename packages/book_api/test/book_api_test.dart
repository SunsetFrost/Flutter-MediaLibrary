import 'package:flutter_test/flutter_test.dart';

import 'package:book_api/book_api.dart';

void main() {
  const String _baseUrl = 'http://127.0.0.1:3000';
  late BookAPIClient apiClient;

  setUpAll(() {
    apiClient = BookAPIClient(baseUrl: _baseUrl);
  });
  group('api test', () {
    test('list', () async {
      final books = await apiClient.getPopularList({'page': 1});
      print(books);
      expect(books, isList);
    });

    test('detail', () async {
      final book = await apiClient.getDetail('B81wDAAAQBAJ');
      print(book);
      expect(book, isInstanceOf<BookInfo>());
    });
  });
}
