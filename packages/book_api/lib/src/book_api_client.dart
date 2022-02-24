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
    return '/search';
  }

  @override
  String get searchPattern {
    return '/search';
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
  List<dynamic> toList(Response res) {
    print(res);
    return res.data['items'];
  }

  String get version {
    return 'version 1.0';
  }
}
