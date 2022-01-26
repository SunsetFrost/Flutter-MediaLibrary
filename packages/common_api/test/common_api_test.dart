import 'package:flutter_test/flutter_test.dart';

import 'package:common_api/common_api.dart';

void main() {
  const String url = 'http://127.0.0.1:3000';
  test('movie subclass', () async {
    final subapi = CommonAPI.fromLibrary(url, APIType.movie);
    final items = await subapi.getPopularList({'page': 1});
    print(items);
    expect(items, isList);
  });

  test('pokemon subclass', () async {
    final subapi = CommonAPI.fromLibrary(url, APIType.pokemon);
    final items = await subapi.getPopularList({'page': 1});
    print(items);
    expect(items, isList);
  });
}
