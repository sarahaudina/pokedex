import 'dart:io';

abstract class BaseHttpRequest {
  final String endpoint;
  Map<String, dynamic> toMap();
  final ContentType contentType;
  final bool shouldCache;

  BaseHttpRequest({required this.endpoint, required this.contentType, this.shouldCache = false});
}
