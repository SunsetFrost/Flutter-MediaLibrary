import 'package:common_api/common_api.dart';
import 'package:moviedb_api/moviedb_api.dart';

class MovieAPIConvertFailure implements Exception {}

class MoviedbAPIClient extends CommonAPI {
  MoviedbAPIClient({
    required baseUrl,
  }) : super(baseUrl: baseUrl);

  @override
  String endPoint = '/video';

  @override
  String popularPattern = '/';

  @override
  String searchPattern = '/search/movie';

  @override
  String detailPattern = '/';

  @override
  Video toItem(Map<String, dynamic> json) {
    try {
      return Video.fromJson(json);
    } catch (e) {
      throw MovieAPIConvertFailure();
    }
  }

  @override
  Video toDetailItem(Map<String, dynamic> json) {
    try {
      return Video.fromJson(json);
    } catch (e) {
      throw MovieAPIConvertFailure();
    }
  }

  @override
  List<Video> toList(dynamic data) {
    final list = data['results'];
    return list.map<Video>((json) => toItem(json)).toList();
  }

  String get version {
    return 'version 1.0';
  }

  Future<List<VideoTrailer>> getVideoTrailer(id) async {
    final url = '/video/trailer/' + id.toString();

    final response = await super.dio.get(url);

    final trailers = response.data
        .map<VideoTrailer>((json) => VideoTrailer.fromJson(json))
        .toList();
    return trailers;
  }
}

// class MockInterceptor extends Interceptor {
//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     final resourcePath = getMockJsonPath(options.path);
//     if (isMock && resourcePath != '') {
//       final data = await rootBundle.load(resourcePath);
//       final map = json.decode(
//         utf8.decode(
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
//         ),
//       );

//       return handler.resolve(Response(
//         requestOptions: options,
//         data: map,
//         statusCode: 200,
//       ));
//     } else {
//       return handler.next(options);
//     }
//   }
// }
