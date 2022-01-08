import 'package:media_library/model/MusicTrack.dart';
import 'package:media_library/net/api.dart';
import 'package:media_library/model/MusicAlbum.dart';

class MusicData {
  static Future<List<Album>> getAlbumList({page = 1}) async {
    final url = '/music/new-releases';
    final response = await httpManager.fetch(url, queryParameters: {
      'page': page,
    });
    final result = response['albums']['items'];
    final albumList =
        result.map<Album>((json) => Album.fromJson(json)).toList();

    return albumList;
  }

  static Future<List<Track>> getTrackList(id) async {
    final url = '/music/' + id.toString();
    final response = await httpManager.fetch(url);
    final result = response['items'];
    final trackList =
        result.map<Track>((json) => Track.fromJson(json)).toList();

    return trackList;
  }
}
