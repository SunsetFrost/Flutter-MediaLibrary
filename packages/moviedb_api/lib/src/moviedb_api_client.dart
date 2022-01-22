import 'package:dio/dio.dart';
import 'package:common_api/common_api.dart';
import 'package:moviedb_api/src/models/video.dart';

import 'models/models.dart';

class MovieAPIConvertFailure implements Exception {}

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
  Future<List<Video>> getRecommandList(Map<String, dynamic> queryParams) async {
    final list = await super.getRecommandList(queryParams);
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
