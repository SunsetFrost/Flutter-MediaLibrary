import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import 'package:moviedb_api/moviedb_api.dart';
import 'package:pokemon_api/pokemon_api.dart';

enum APIType { movie, music, book, pokemon }

class CommonAPIRequestFailure implements Exception {}

abstract class CommonAPI {
  CommonAPI({required baseUrl}) : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  factory CommonAPI.fromLibrary(String baseUrl, APIType type) {
    if (type == APIType.movie) {
      return MoviedbAPIClient(baseUrl: baseUrl);
    } else if (type == APIType.pokemon) {
      return PokemonAPIClient(baseUrl: baseUrl);
    } else {
      throw Exception('initialize error');
    }
  }

  final Dio _dio;

  @protected
  String get endPoint;

  @protected
  String get popularPattern;

  @protected
  String get searchPattern;

  Future<List<dynamic>> getPopularList(Map<String, dynamic> params) async {
    try {
      final response =
          await _dio.get(endPoint + popularPattern, queryParameters: params);
      return toList(response).map((json) => toItem(json)).toList();
    } catch (e) {
      throw CommonAPIRequestFailure();
    }
  }

  Future<List<dynamic>> getSearchList(Map<String, dynamic> params) async {
    try {
      final response =
          await _dio.get(endPoint + searchPattern, queryParameters: params);
      return toList(response).map((json) => toItem(json)).toList();
    } catch (e) {
      throw CommonAPIRequestFailure();
    }
  }

  Future<dynamic> getDetail(String id) async {
    // try {
    final response = await _dio.get(endPoint + '/' + id);
    if (response.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }
    return toItem(response.data);
    // } catch (e) {
    //   throw CommonAPIRequestFailure();
    // }
  }

  Object toItem(Map<String, dynamic> json);

  List<dynamic> toList(Response res) {
    return res.data;
  }
}
