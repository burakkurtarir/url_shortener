// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorModel _$BaseErrorModelFromJson(Map<String, dynamic> json) {
  return BaseErrorModel(
    ok: json['ok'] as bool?,
    errorCode: json['error_code'] as int?,
    error: json['error'] as String?,
  );
}

Map<String, dynamic> _$BaseErrorModelToJson(BaseErrorModel instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'error_code': instance.errorCode,
      'error': instance.error,
    };
