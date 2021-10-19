import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/constants.dart';
import 'package:pokemon/utils/utils.dart';

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
