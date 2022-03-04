import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:library_repository/library_repository.dart';

class GlobleCacheData {
  static List<Video> favorVideos = [];
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    final _favorVideos = _prefs.getStringList('favorVideos');
    if (_favorVideos != null) {
      try {
        favorVideos =
            _favorVideos.map((e) => Video.fromJson(jsonDecode(e))).toList();
      } catch (e) {
        favorVideos = [];
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
