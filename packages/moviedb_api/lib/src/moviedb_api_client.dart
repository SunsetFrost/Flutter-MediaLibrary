import 'package:dio/dio.dart';
import 'package:common_api/common_api.dart';
import 'package:moviedb_api/moviedb_api.dart';
import 'package:moviedb_api/src/models/video.dart';

import 'models/models.dart';

class MovieAPIConvertFailure implements Exception {}

class MovieAPIQueryParams extends CommonParams {
  MovieAPIQueryParams({required this.page}) : super();

  final int page;
}

class MoviedbAPIClient extends CommonAPIClient {
  MoviedbAPIClient(
      {required String baseUrl,
      required String recommandPattern,
      required String searchPattern,
      Dio? dio})
      : super(
            baseUrl: baseUrl,
            recommandPattern: recommandPattern,
            searchPattern: searchPattern,
            dio: dio);

  @override
  Future<List<Video>> getRecommandList(int page) async {
    final list = await super.getRecommandList(page);
    try {
      final videoList =
          list.map<Video>((json) => Video.fromJson(json)).toList();
      return videoList;
    } catch (e) {
      throw MovieAPIConvertFailure();
    }
  }

  String version() {
    return 'version 0.0';
  }
}
