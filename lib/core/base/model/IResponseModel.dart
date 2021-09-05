import 'package:url_shortener/core/base/model/base_error_model.dart';

abstract class IResponseModel<T> {
  T? data;
  BaseErrorModel? error;
  int? statusCode;
}

class ResponseModel<T> extends IResponseModel<T> {
  @override
  final T? data;
  @override
  final BaseErrorModel? error;
  @override
  int? statusCode;

  ResponseModel({this.data, this.error, this.statusCode});
}
