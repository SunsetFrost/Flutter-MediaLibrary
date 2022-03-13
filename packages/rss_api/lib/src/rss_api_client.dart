import 'package:webfeed/webfeed.dart';
import 'package:common_api/common_api.dart';

class RssPath {
  RssPath(this.name, this.routes);

  final String name;
  final Object routes;
}

class RssAPIClient extends CommonAPI {
  RssAPIClient({
    required baseUrl,
  })  : _baseUrl = baseUrl,
        super(baseUrl: baseUrl);

  @override
  String endPoint = '/';

  @override
  String popularPattern = '/api/routes';

  @override
  String searchPattern = '/';

  @override
  String detailPattern = '/';

  final String _baseUrl;

  @override
  List<RssPath> toList(data) {
    return data.entries
        .map<RssPath>((entry) => RssPath(entry.key, entry.value))
        .toList();
  }

  Future<RssFeed> getRssObject(String path) async {
    final fullPath = _baseUrl + path;
    final response = await super.dio.get(fullPath);
    if (response.statusCode == 200) {
      final rssObject = RssFeed.parse(response.data);
      return rssObject;
    } else {
      throw Exception('rss request failure');
    }
  }
}
