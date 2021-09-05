// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_link_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortLinkResponse _$ShortLinkResponseFromJson(Map<String, dynamic> json) {
  return ShortLinkResponse(
    ok: json['ok'] as bool?,
    result: json['result'] == null
        ? null
        : ShortLinkModel.fromJson(json['result'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ShortLinkResponseToJson(ShortLinkResponse instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'result': instance.result,
    };
