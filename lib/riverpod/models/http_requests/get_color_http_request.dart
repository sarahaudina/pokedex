import 'dart:io';

import 'package:pokedex/riverpod/constants.dart';
import 'package:pokedex/riverpod/models/http_requests/base_http_request.dart';

class GetColorHttpRequest extends BaseHttpRequest {
  final int colorId;

  GetColorHttpRequest(this.colorId) : super(
      endpoint: '/pokemon-color/$colorId',
      contentType: ContentType.parse(contentTypeApplicationJson));

  @override
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>();
  }
}