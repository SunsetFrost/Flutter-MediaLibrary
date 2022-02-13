import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

import 'package:moviedb_api/moviedb_api.dart';
import 'package:pokemon_api/pokemon_api.dart';
import 'package:spotify_api/spotify_api.dart';
import 'package:book_api/book_api.dart';

enum APIType { movie, music, book, pokemon }

class CommonAPIRequestFailure implements Exception {}

abstract class CommonAPI {
  CommonAPI({required baseUrl}) : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  factory CommonAPI.fromLibrary(String baseUrl, APIType type) {
    if (type == APIType.movie) {
      return MoviedbAPIClient(baseUrl: baseUrl);
    } else if (type == APIType.pokemon) {
      return PokemonAPIClient(baseUrl: baseUrl);
    } else if (type == APIType.music) {
      return SpotifyAPIClient(baseUrl: baseUrl);
    } else if (type == APIType.book) {
      return BookAPIClient(baseUrl: baseUrl);
    } else {
      throw Exception('api initialize error');
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
    final response =
        await _dio.get(endPoint + popularPattern, queryParameters: params);

    if (response.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }
    return toList(response).map((json) => toItem(json)).toList();
  }

  Future<List<dynamic>> getSearchList(Map<String, dynamic> params) async {
    final response =
        await _dio.get(endPoint + searchPattern, queryParameters: params);

    if (response.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }
    return toList(response).map((json) => toItem(json)).toList();
  }

  Future<dynamic> getDetail(String id) async {
    final response = await _dio.get(endPoint + '/' + id);
    if (response.statusCode != 200) {
      throw CommonAPIRequestFailure();
    }
    return toItem(response.data);
  }

  Object toItem(Map<String, dynamic> json);

  List<dynamic> toList(Response res) {
    return res.data;
  }
}
