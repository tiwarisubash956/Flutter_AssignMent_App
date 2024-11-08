import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print("Request [${options.method}] => URL: ${options.uri}");
    }
    if (kDebugMode) {
      print("Headers: ${options.headers}");
    }

    if (options.data != null) {
      if (kDebugMode) {
        print("Request Data: ${options.data}");
      }
    }
    super.onRequest(options, handler); // Continue the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        "Response [${response.statusCode}] => URL: ${response.requestOptions.uri}");
    }
    if (kDebugMode) {
      print("Response Data: ${response.data}");
    }
    super.onResponse(response, handler);
    if (kDebugMode) {
      print("Redirect Location: ${response.headers['location']}");
    }
// Continue the response
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        "Error [${error.response?.statusCode}] => URL: ${error.requestOptions.uri}");
    }
    if (kDebugMode) {
      print("Error Message: ${error.message}");
    }
    if (error.response != null) {
      if (kDebugMode) {
        print("Error Data: ${error.response?.data}");
      }
    }
    super.onError(error, handler); // Continue the error
  }
}
