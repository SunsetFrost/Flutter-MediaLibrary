import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:media_library/constants.dart';

/* 
  获取需要mock的接口
*/
String getMockJsonPath(String path) {
  const _jsonDir = 'assets/json';
  const _jsonExtension = '.json';

  if (path == '/pokemon') {
    return _jsonDir + '/pokemon/pokeList' + _jsonExtension;
  } else if (path.startsWith('/pokemon/')) {
    return _jsonDir + '/pokemon/pokeDetail' + _jsonExtension;
  } else if (path == '/video') {
    return _jsonDir + '/video/list' + _jsonExtension;
  } else if (path.startsWith('/video/')) {
    return _jsonDir + '/video/detail' + _jsonExtension;
  } else if (path == '/music/albums') {
    return _jsonDir + '/music/albums' + _jsonExtension;
  } else {
    return '';
  }
}

class MockInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final resourcePath = getMockJsonPath(options.path);
    if (isDev) {
      final data = await rootBundle.load(resourcePath);
      final map = json.decode(
        utf8.decode(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
        ),
      );

      return handler.resolve(Response(
        requestOptions: options,
        data: map,
        statusCode: 200,
      ));
    } else {
      return handler.next(options);
    }
  }
}
