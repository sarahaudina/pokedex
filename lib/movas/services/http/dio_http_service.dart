import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/movas/models/http_requests/base_http_request.dart';
import 'package:pokedex/movas/services/http/base_http_service.dart';

String contentTypeApplicationJson = "application/json; charset=utf-8";

class MobileDioHttpService extends BaseHttpService {
  String token = "";

  final Dio dio;

  MobileDioHttpService(this.dio,
      {required String baseUrl}) {
    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 200000;
    dio.options.receiveTimeout = 50000;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
          print('to: ${options.uri}');

          return handler.next(options);
        },
        onError: (DioError error, __){
          throw error;
        }
      )
    );
  }

  @override
  Future<T> get<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter}) async {
    var options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );

    final response = await dio.get(request.endpoint,
        queryParameters: request.toMap(), options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));

      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> post<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter}) async {
    var options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );

    // if (request.shouldCache) {
    //   options = _cacheOptions;
    // }

    final response = await dio.post(request.endpoint,
        data: request.toMap(), options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));
      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> delete<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter}) async {
    var options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );

    // if (request.shouldCache) {
    //   options = _cacheOptions;
    // }

    final response = await dio.delete(request.endpoint,
        data: request.toMap(), options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));

      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }

  @override
  Future<T> put<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter}) async {
    var options = Options(
      contentType: Headers.formUrlEncodedContentType,
    );

    // if (request.shouldCache) {
    //   options = _cacheOptions;
    // }

    final response = await dio.put(request.endpoint,
        data: request.toMap(), options: options);

    if (converter == null) {
      if (response.data is String) return (jsonDecode(response.data));
      return response.data;
    }

    if (response.data is String) {
      return converter(jsonDecode(response.data));
    }

    return converter(response.data);
  }
}
