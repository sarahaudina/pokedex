import 'dart:io';

import 'package:pokedex/movas/models/http_requests/base_http_request.dart';
import 'package:pokedex/movas/services/http/dio_http_service.dart';

class GetPokemonDetailsHttpRequest extends BaseHttpRequest {
  final String name;

  GetPokemonDetailsHttpRequest(this.name) : super(
      endpoint: '/pokemon/$name',
      contentType: ContentType.parse(contentTypeApplicationJson));

  @override
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>();
  }
}