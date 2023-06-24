import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/movas/services/http/base_http_service.dart';
import 'package:pokedex/movas/services/http/dio_http_service.dart';

final httpServiceProvider = Provider<BaseHttpService>((ref) => DioHttpService(Dio(), baseUrl: ""));


