import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/riverpod/services/http/dio_http_service.dart';
import 'package:pokedex/riverpod/services/http/http_service.dart';

final dioServiceProvider = Provider<HttpService>((ref) => DioHttpService(Dio(), baseUrl: ""));


