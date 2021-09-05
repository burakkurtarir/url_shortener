import 'package:json_annotation/json_annotation.dart';
import 'package:url_shortener/core/base/model/base_model.dart';

part 'short_link_model.g.dart';

@JsonSerializable()
class ShortLinkModel extends BaseModel<ShortLinkModel> {
  final String? code;

  @JsonKey(name: 'short_link')
  final String? shortLink;

  @JsonKey(name: 'full_short_link')
  final String? fullShortLink;

  @JsonKey(name: 'short_link2')
  final String? shortLink2;

  @JsonKey(name: 'full_short_link2')
  final String? fullShortLink2;

  @JsonKey(name: 'share_link')
  final String? shareLink;

  @JsonKey(name: 'full_share_link')
  final String? fullShareLink;

  @JsonKey(name: 'original_link')
  final String? originalLink;

  ShortLinkModel({
    this.code,
    this.shortLink,
    this.fullShortLink,
    this.shortLink2,
    this.fullShortLink2,
    this.shareLink,
    this.fullShareLink,
    this.originalLink,
  });

  @override
  ShortLinkModel fromJson(Map<String, dynamic> json) {
    return _$ShortLinkModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ShortLinkModelToJson(this);
  }

  factory ShortLinkModel.fromJson(Map<String, dynamic> json) {
    return _$ShortLinkModelFromJson(json);
  }
}
