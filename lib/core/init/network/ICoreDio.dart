import 'package:dio/dio.dart';

import '../../constants/http_types.dart';

abstract class ICoreDio {
  Future<Response> send(
    String path, {
    required HttpTypes type,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });
}
