import 'package:common_api/common_api.dart';
import 'package:spotify_api/spotify_api.dart';

class SpotifyAPIConvertFailure implements Exception {}

class SpotifyAPIToListFailture implements Exception {}

class SpotifyAPIClient extends CommonAPI {
  SpotifyAPIClient({
    required baseUrl,
  }) : super(baseUrl: baseUrl);

  @override
  String get endPoint {
    return '/music';
  }

  @override
  String get popularPattern {
    return '/new-releases';
  }

  @override
  String get searchPattern {
    return '/search';
  }

  @override
  String get detailPattern {
    return '/';
  }

  @override
  Album toItem(Map<String, dynamic> json) {
    try {
      return Album.fromJson(json);
    } catch (e) {
      throw SpotifyAPIConvertFailure;
    }
  }

  @override
  List<Track> toDetailItem(Map<String, dynamic> json) {
    try {
      List<dynamic> items = json['items'];
      return items.map((item) => Track.fromJson(item)).toList();
    } catch (e) {
      throw SpotifyAPIConvertFailure;
    }
  }

  @override
  List<dynamic> toList(Response res) {
    try {
      return res.data['albums']['items'];
    } catch (e) {
      throw SpotifyAPIToListFailture();
    }
  }

  String get version {
    return 'version 1.0';
  }
}
