import 'package:dio/dio.dart';

import 'package:pokemon/net/mock_interceptor.dart';
import 'package:pokemon/constants.dart';

class HttpManager {
  var options = BaseOptions(
    baseUrl: backendURI + apiVersion,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  Dio _dio = new Dio();

  HttpManager() {
    _dio.options = options;
    _dio.interceptors.add(new MockInterceptor());
  }

  fetch(url, params, Options? option) async {
    Response response;

    if (option == null) {
      option = new Options(method: 'get');
    }

    try {
      response = await _dio.request(url, data: params, options: option);
    } catch (e) {
      return e;
    }

    return response.data;
  }
}

final HttpManager httpManager = new HttpManager();
