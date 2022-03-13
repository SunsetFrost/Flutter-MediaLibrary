import 'package:flutter_test/flutter_test.dart';
import 'package:spotify_api/spotify_api.dart';

void main() {
  const String _baseUrl = 'http://127.0.0.1:3000';
  late SpotifyAPIClient apiClient;

  setUpAll(() {
    apiClient = SpotifyAPIClient(baseUrl: _baseUrl);
  });
  group('api test', () {
    test('list', () async {
      final albums = await apiClient.getPopularList({'page': 1});
      print(albums);
      expect(albums, isList);
    });

    test('detail', () async {
      final tracks = await apiClient.getDetail('6FIMt58naoGYrOe4Wn2P3n');
      print(tracks);
      expect(tracks, isList);
    });
  });
}
