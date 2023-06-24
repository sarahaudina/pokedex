import 'dart:io';

import 'package:pokedex/riverpod/constants.dart';
import 'package:pokedex/riverpod/models/http_requests/base_http_request.dart';

class GetPokemonsHttpRequest extends BaseHttpRequest {
  final int? page;

  GetPokemonsHttpRequest(this.page) : super(
      endpoint: '/pokemon/?offset=$page',
      contentType: ContentType.json);

  @override
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>();
  }
}