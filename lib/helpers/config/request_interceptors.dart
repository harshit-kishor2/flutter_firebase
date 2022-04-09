/* ************************************************************************
* Directory Name: config                                                  *
* File Name: request_interceptors.dart                                    *
* Created At: Saturday, 9th April 2022 8:51:13 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

import 'package:dio/dio.dart';
import 'package:flutter_firebase/helpers/index.dart';

//! Dio Interceptor Setup
class RequestInterceptor extends Interceptor {
  //* Start of RequestInterceptor class */

  final Dio api = Dio();

  //* ============================ On-Request =====================
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    printError('REQUEST[${options.method}] => ${options.uri}');
    // //Get saved tokens from local storage
    // String savedTokens = await SharedPref.getString(key: SharedPref.prefTokens);
    // if (savedTokens.isNotEmpty) {
    //   if (tokens.access.isNotEmpty) {
    //     String token = tokens.access;
    //     options.headers["Authorization"] = 'JWT $token';
    //   }
    // }
    return super.onRequest(options, handler);
  }

  //* ============================ On-Error =====================

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    printError(
        "=== Dio Error Occured ==> ErrorResponse[${err.response?.statusCode}] ===");
    if (err.type == DioErrorType.response) {
      printError(
          'ErrorResponse[${err.response?.statusCode}] =>${err.response}');
    }
    if (err.type == DioErrorType.connectTimeout) {
      printError('check your connection');
    }

    if (err.type == DioErrorType.receiveTimeout) {
      printError('unable to connect to the server');
    }

    if (err.type == DioErrorType.other) {
      printError('Something went wrong');
    }
    // consider to remap this error to generic error.
    return super.onError(err, handler);
  }

  //* ============================ On-Response =====================

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    printError(
        "=== Dio Success Occured ==> RESPONSE[${response.statusCode}] ===");

    return super.onResponse(response, handler);
  }
  //* End of Interceptor class */
}

//! ========================= Dio Client Setup ===========================
class DioClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'ApiConst.baseURL';
  final RequestInterceptor requestInterceptor = RequestInterceptor();

  DioClient();

  BaseOptions _dioOptions() {
    BaseOptions opts = BaseOptions();
    opts.baseUrl = _baseUrl;
    opts.connectTimeout = 60000;
    opts.receiveTimeout = 60000;
    opts.sendTimeout = 60000;
    return opts;
  }

  Dio provideDio() {
    _dio.options = _dioOptions();
    _dio.interceptors.add(requestInterceptor);
    return _dio;
  }
}
