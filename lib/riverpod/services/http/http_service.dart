import 'package:pokedex/riverpod/models/http_requests/base_http_request.dart';

abstract class HttpService {
  Future<T> post<T>({
    required BaseHttpRequest request,
    T Function(Map<String, dynamic> data)? converter,
  });

  Future<T> get<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter});

  Future<T> put<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter});

  Future<T> delete<T>(
      {required BaseHttpRequest request,
        T Function(Map<String, dynamic> data)? converter});
}
