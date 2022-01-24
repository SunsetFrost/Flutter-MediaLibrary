import 'package:dio/dio.dart';

import 'package:media_library/net/mock_interceptor.dart';
import 'package:media_library/constants.dart';

class HttpManager {
  var options = BaseOptions(
    baseUrl: backendURI,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio _dio = new Dio();

  HttpManager() {
    _dio.options = options;
    _dio.interceptors.add(new MockInterceptor());
  }

  fetch(
    String url, {
    dynamic params,
    Map<String, dynamic>? queryParameters,
    Options? option,
  }) async {
    Response response;

    if (option == null) {
      option = new Options(method: 'get');
    }
    try {
      response = await _dio.request(url,
          data: params, queryParameters: queryParameters, options: option);
      return response.data;
    } on DioError catch (e) {
      print(e);
      if (e.response == null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}

final HttpManager httpManager = new HttpManager();
