import 'dart:io';

import 'package:pokedex/movas/models/http_requests/base_http_request.dart';

class GetTypeHttpRequest extends BaseHttpRequest {
  final String type;

  GetTypeHttpRequest(this.type) : super(endpoint: '/type/${type}', contentType: ContentType.json);

  @override
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>();
  }
}

class GetTypesUrlHttpRequest extends BaseHttpRequest {
  GetTypesUrlHttpRequest() : super(
      endpoint: '/type',
      contentType: ContentType.json);

  @override
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>();
  }
}