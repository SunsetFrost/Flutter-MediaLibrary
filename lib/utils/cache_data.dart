import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:library_repository/library_repository.dart';

class GlobleCacheData {
  static List<Video> favorVideos = [];
  static List<Album> favorMusics = [];
  static List<BookInfo> favorBooks = [];
  static late SharedPreferences _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    final _favorVideos = _prefs.getStringList('favorVideos');
    final _favorMusics = _prefs.getStringList('favorMusics');
    final _favorBooks = _prefs.getStringList('favorBooks');

    if (_favorVideos != null) {
      try {
        favorVideos =
            _favorVideos.map((e) => Video.fromJson(jsonDecode(e))).toList();
      } catch (e) {
        favorVideos = [];
      }
    }

    if (_favorMusics != null) {
      try {
        favorMusics =
            _favorMusics.map((e) => Album.fromJson(jsonDecode(e))).toList();
      } catch (e) {
        favorMusics = [];
      }
    }

    if (_favorBooks != null) {
      try {
        favorBooks =
            _favorBooks.map((e) => BookInfo.fromJson(jsonDecode(e))).toList();
      } catch (e) {
        favorBooks = [];
      }
    }
  }

  // 持久化当前视频列表
  static saveVideos() {
    final favorVideosJson =
        favorVideos.map((video) => jsonEncode(video)).toList();
    _prefs.setStringList('favorVideos', favorVideosJson);
  }

  static saveMusics() {
    final favorMusicsJson =
        favorMusics.map((album) => jsonEncode(album)).toList();
    _prefs.setStringList('favorMusics', favorMusicsJson);
  }

  static saveBooks() {
    final favorBooksJson = favorBooks.map((book) => jsonEncode(book)).toList();
    _prefs.setStringList('favorBooks', favorBooksJson);
  }
}
