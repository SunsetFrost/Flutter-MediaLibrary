import 'package:common_api/common_api.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:library_repository/library_repository.dart';

void main() {
  test('cache equal', () {
    final params1 = {'page': 1, 'sort': 'desc'};
    final testKey1 = CacheKey(APIType.movie, params1);
    final params2 = {'sort': 'desc', 'page': 1};
    final testKey2 = CacheKey(APIType.movie, params2);

    final cache = LibraryCache();
    cache.set(testKey1, 'test result');

    final isEqual = cache.contains(testKey2);

    expect(isEqual, true);
  });

  test('get data from cache', () async {
    final repo = LibraryRepository(
        baseUrl: 'http://127.0.0.1:3000', type: APIType.movie);

    // await repo.getPopularList({'page': 1});
    final result2 = await repo.getSearchList({'text': 'harry'});
    print(result2);
    expect(result2, isList);
  });

  test('get book data', () async {
    final repo =
        LibraryRepository(baseUrl: 'http://127.0.0.1:3000', type: APIType.book);

    // await repo.getPopularList({'page': 1});
    final result2 = await repo.getPopularList({});
    print(result2);
    expect(result2, isList);
  });

  /// detail test
  group('detail test', () {
    test('get movie detail data', () async {
      final repo = LibraryRepository(
          baseUrl: 'http://127.0.0.1:3000', type: APIType.movie);
      final data = await repo.getDetail('634649');
      print(data);
    });
    test('get music detail data', () async {
      final repo = LibraryRepository(
          baseUrl: 'http://127.0.0.1:3000', type: APIType.music);
      final data = await repo.getDetail('1tiCHRx9AI11hfcLmkGEXT');
      print(data);
    });
    test('get book detail data', () async {
      final repo = LibraryRepository(
          baseUrl: 'http://127.0.0.1:3000', type: APIType.book);
      final data = await repo.getDetail('BMzjMgEACAAJ');
      print(data);
    });
    test('get pokemon detail data', () async {
      final repo = LibraryRepository(
          baseUrl: 'http://127.0.0.1:3000', type: APIType.pokemon);
      final data = await repo.getDetail('1');
      print(data);
    });
  });
}
