import 'package:json_annotation/json_annotation.dart';
import 'package:url_shortener/core/base/model/base_model.dart';

part 'base_error_model.g.dart';

@JsonSerializable()
class BaseErrorModel extends BaseModel {
  final bool? ok;

  @JsonKey(name: 'error_code')
  final int? errorCode;

  final String? error;

  BaseErrorModel({this.ok, this.errorCode, this.error});

  @override
  fromJson(Map<String, dynamic> json) {
    return _$BaseErrorModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BaseErrorModelToJson(this);
  }

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) {
    return _$BaseErrorModelFromJson(json);
  }
}
