import 'package:media_library/constants.dart' as Constants;
import 'package:media_library/net/api.dart';
import 'package:media_library/model/Video.dart';
import 'package:media_library/model/VideoDetail.dart';
import 'package:media_library/model/VideoTrailer.dart';

class VideoData {
  static Future<List<Video>> getVideoList({page = 1}) async {
    final url = '/video';
    final response = await httpManager.fetch(url, queryParameters: {
      'page': page,
    });
    final result = response['results'];
    try {
      final videoList =
          result.map<Video>((json) => Video.fromJson(json)).toList();
      return videoList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<VideoInfo> getVideoDetail(id) async {
    final url = '/video/' + id.toString();

    final response = await httpManager.fetch(url);

    final videoDetail = VideoInfo.fromJson(response);
    return videoDetail;
  }

  static Future<VideoTrailer> getVideoTrailer(id) async {
    final url = '/video/trailer/' + id.toString();

    final response = await httpManager.fetch(url);

    final trailer = VideoTrailer.fromJson(response);
    return trailer;
  }

  static String getImagePath(String relativePath) {
    final rootpath = Constants.videoImageUrl;
    return rootpath + relativePath;
  }
}
