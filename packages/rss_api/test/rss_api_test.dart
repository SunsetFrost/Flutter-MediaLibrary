import 'package:flutter_test/flutter_test.dart';

import 'package:rss_api/rss_api.dart';

void main() {
  const String baseUrl = 'https://rsshub.app';
  RssAPIClient rssAPIClient = RssAPIClient(baseUrl: baseUrl);

  group('api test', () {
    test('get routes', () async {
      final routes = await rssAPIClient.getPopularList({});
      print(routes);
    });

    test('get rss object', () async {
      final rssObj =
          await rssAPIClient.getRssObject('/gcores/category/articles');
      print(rssObj);
    });
  });
}
