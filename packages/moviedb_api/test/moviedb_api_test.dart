import 'package:flutter_test/flutter_test.dart';

import 'package:moviedb_api/moviedb_api.dart';

void main() {
  const String _baseUrl = 'http://127.0.0.1:3000';
  late MoviedbAPIClient movieAPI;

  setUpAll(() {
    movieAPI = MoviedbAPIClient(baseUrl: _baseUrl);
  });
  group('api test', () {
    test('popular movie api', () async {
      final movies = await movieAPI.getPopularList({'page': 1});
      print(movies);
      expect(movies, isList);
    });

    test('detail', () async {
      final movie = await movieAPI.getDetail('512195');
      print(movie);
      expect(movie, isInstanceOf<Video>());
    });

    test('trailer', () async {
      final trailers = await movieAPI.getVideoTrailer(512195);
      print(trailers);
      expect(trailers, isList);
    });
  });
}
