import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../constants/http_types.dart';
import '../../extensions/network_extension.dart';
import 'ICoreDio.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  CoreDio(options) {
    this.options = options;
    interceptors.add(InterceptorsWrapper());
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  @override
  Future<Response> send(
    String path, {
    required HttpTypes type,
    data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await request(
      path,
      data: data,
      options: Options(method: type.rawValue),
      queryParameters: queryParameters,
    );

    return response;
  }
}
