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

  fetch(String url,
      {dynamic params,
      Map<String, dynamic>? queryParameters,
      Options? option}) async {
    Response response;

    if (option == null) {
      option = new Options(method: 'get');
    }
    try {
      response = await _dio.request(url,
          data: params, queryParameters: queryParameters, options: option);
    } catch (e) {
      return e;
    }

    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();
