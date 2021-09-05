import '../constants/http_types.dart';

extension NetworkExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      case HttpTypes.PUT:
        return 'PUT';
      case HttpTypes.DELETE:
        return 'DELETE';
      case HttpTypes.PATCH:
        return 'PATCH';
      default:
        return 'Http Type Error';
    }
  }
}
