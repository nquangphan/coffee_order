import 'dart:async';
import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }

  @override
  Future<void> onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // Only log in debug mode

    if (response.data is List) {
      Map<String, dynamic> mapData = {};
      mapData.putIfAbsent("items", () => response.data);
      response.data = mapData;
    }

    return handler.next(response);
  }
}
