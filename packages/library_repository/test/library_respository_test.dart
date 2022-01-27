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

    await repo.getPopularList({'page': 1});
    final result2 = await repo.getPopularList({'page': 1});
    print(result2);
    expect(result2, isList);
  });
}
