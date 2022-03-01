import 'package:common_api/common_api.dart';
import 'package:book_api/book_api.dart';

class BookAPIConvertFailure implements Exception {}

class BookAPIClient extends CommonAPI {
  BookAPIClient({required baseUrl}) : super(baseUrl: baseUrl);

  @override
  String get endPoint {
    return '/book';
  }

  @override
  String get popularPattern {
    return '/best-sellers';
  }

  @override
  String get searchPattern {
    return '/search';
  }

  @override
  String get detailPattern {
    return '/volumes/';
  }

  @override
  BookInfo toItem(Map<String, dynamic> json) {
    try {
      return BookInfo.fromJson(json);
    } catch (e) {
      throw BookAPIConvertFailure();
    }
  }

  @override
  BookInfo toDetailItem(Map<String, dynamic> json) {
    try {
      return BookInfo.fromJson(json);
    } catch (e) {
      throw BookAPIConvertFailure();
    }
  }

  @override
  List<dynamic> toList(Response res) {
    return res.data;
  }

  String get version {
    return 'version 1.0';
  }
}
