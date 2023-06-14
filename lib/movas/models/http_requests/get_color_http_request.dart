import 'dart:io';

import 'package:pokedex/movas/models/http_requests/base_http_request.dart';
import 'package:pokedex/movas/services/http/dio_http_service.dart';

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