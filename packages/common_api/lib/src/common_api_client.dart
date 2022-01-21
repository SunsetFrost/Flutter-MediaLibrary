import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:common_api/common_api.dart';

class CommonAPIRequestFailure implements Exception {}

class CommonAPINoFoundFailure implements Exception {}

/// Common API Client
class CommonAPIClient {
  CommonAPIClient({required String baseUrl, Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(baseUrl: baseUrl),
            );

  final Dio _dio;
  final String recommandPattern = '/popular/';
  final String searchPattern = '/search/';

  /// Get Recommand List
  Future<Map<String, dynamic>> getRecommandList(
      Map<String, dynamic> queryParams) async {
    final recommandResponse =
        await _dio.get(recommandPattern, queryParameters: queryParams);

    if (recommandResponse.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }

    final commonJson = jsonDecode(recommandResponse.data) as List;

    if (commonJson.isEmpty) {
      throw CommonAPINoFoundFailure();
    }

    return commonJson as Map<String, dynamic>;
  }

  /// Get Search List
  Future<Map<String, dynamic>> getSearchList(
      Map<String, dynamic> queryParams) async {
    final searchResponse =
        await _dio.get(searchPattern, queryParameters: queryParams);

    if (searchResponse.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }

    final commonJson = jsonDecode(searchResponse.data) as List;

    if (commonJson.isEmpty) {
      throw CommonAPINoFoundFailure();
    }

    return commonJson as Map<String, dynamic>;
  }
}
