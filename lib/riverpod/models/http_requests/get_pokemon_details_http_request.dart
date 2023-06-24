import 'dart:io';

import 'package:pokedex/riverpod/constants.dart';
import 'package:pokedex/riverpod/models/http_requests/base_http_request.dart';

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