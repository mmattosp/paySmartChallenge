import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';

import 'custom_interceptor.dart';

class CustomDio {
  static const String GET = "GET";

  DioForNative _dio;

  static String baseUrl;

  CustomDio() {
    baseUrl = "https://api.themoviedb.org/3";
    _dio = new DioForNative();
    _dio.interceptors.add(CustomInterceptor());
  }

  Future<Response> get(String endPoint, {Map<String, dynamic> params}) async {
    _dio.options = _getCustomBaseOptions(GET);
    return await _dio.get(endPoint, queryParameters: params);
  }

  BaseOptions _getCustomBaseOptions(String method) => BaseOptions(
      method: method,
      baseUrl: baseUrl,
      connectTimeout: 100000,
      receiveTimeout: 5000,
      headers: {"Content-Type": "application/json"});
}
