import 'package:media_library/net/api.dart';
import 'package:media_library/model/Video.dart';
import 'package:media_library/model/VideoDetail.dart';

class VideoData {
  static Future<List<Video>> getVideoList({page = 1}) async {
    final url = '/video';

    final response = await httpManager.fetch(url, {page}, null);
    final result = response['results'];
    final videoList =
        result.map<Video>((json) => Video.fromJson(json)).toList();

    return videoList;
  }

  static Future<VideoInfo> getVideoDetail() async {
    final url = '/video/';

    final response = await httpManager.fetch(url, null, null);

    final videoDetail = VideoInfo.fromJson(response);
    return videoDetail;
  }

  static String getImagePath({relativePath}) {
    return 'https://image.tmdb.org/t/p/w500/' + relativePath;
  }
}
