import 'package:common_api/common_api.dart';
import 'package:moviedb_api/moviedb_api.dart';

class MovieAPIConvertFailure implements Exception {}

class MoviedbAPIClient extends CommonAPI {
  MoviedbAPIClient({
    required baseUrl,
  }) : super(baseUrl: baseUrl);

  @override
  String get endPoint {
    return '/video';
  }

  @override
  String get popularPattern {
    return '/';
  }

  @override
  String get searchPattern {
    return '/search/movie';
  }

  @override
  Video toItem(Map<String, dynamic> json) {
    try {
      return Video.fromJson(json);
    } catch (e) {
      throw MovieAPIConvertFailure();
    }
  }

  @override
  List<dynamic> toList(Response res) {
    return res.data;
  }

  String get version {
    return 'version 1.0';
  }
}
