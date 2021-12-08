import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:media_library/model/VideoDetail.dart';

class GlobleCacheData {
  static List<VideoInfo> favorVideos = [];
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    final _favorVideos = _prefs.getStringList('favorVideos');
    if (_favorVideos != null) {
      try {
        favorVideos =
            _favorVideos.map((e) => VideoInfo.fromJson(jsonDecode(e))).toList();
      } catch (e) {
        print(e);
      }
    }
  }

  // 持久化当前视频列表
  static saveVideos() {
    final favorVideosJson =
        favorVideos.map((video) => jsonEncode(video)).toList();
    _prefs.setStringList('favorVideos', favorVideosJson);
  }
}
