import 'package:dio/dio.dart';

import 'package:moviedb_api/moviedb_api.dart';

class MovieAPIRequestFailure implements Exception {}

class MovieAPIConvertFailure implements Exception {}

const String endPoint = '/video';
const String recommandPattern = '/';

class MoviedbAPIClient {
  MoviedbAPIClient({
    required this.baseUrl,
  }) : this.dio = Dio(BaseOptions(baseUrl: baseUrl));

  final String baseUrl;
  final Dio dio;

  Future<dynamic> getRecommandList(int page) async {
    final params = {
      'page': page,
    };

    try {
      final response =
          await dio.get(endPoint + recommandPattern, queryParameters: params);
      return response.data['results']
          .map<Video>((json) => Video.fromJson(json))
          .toList();
    } catch (e) {
      throw MovieAPIRequestFailure();
    }
  }

  String get version {
    return 'version 1.0';
  }
}
