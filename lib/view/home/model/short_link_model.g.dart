// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortLinkModel _$ShortLinkModelFromJson(Map<String, dynamic> json) {
  return ShortLinkModel(
    code: json['code'] as String?,
    shortLink: json['short_link'] as String?,
    fullShortLink: json['full_short_link'] as String?,
    shortLink2: json['short_link2'] as String?,
    fullShortLink2: json['full_short_link2'] as String?,
    shareLink: json['share_link'] as String?,
    fullShareLink: json['full_share_link'] as String?,
    originalLink: json['original_link'] as String?,
  );
}

Map<String, dynamic> _$ShortLinkModelToJson(ShortLinkModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'short_link': instance.shortLink,
      'full_short_link': instance.fullShortLink,
      'short_link2': instance.shortLink2,
      'full_short_link2': instance.fullShortLink2,
      'share_link': instance.shareLink,
      'full_share_link': instance.fullShareLink,
      'original_link': instance.originalLink,
    };
