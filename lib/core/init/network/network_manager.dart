import 'package:dio/dio.dart';

import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    _instance ??= NetworkManager._init();
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final options = BaseOptions(baseUrl: 'https://api.shrtco.de/v2/');
    coreDio = CoreDio(options);
  }
}
