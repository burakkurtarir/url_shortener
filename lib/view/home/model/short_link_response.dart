import 'package:json_annotation/json_annotation.dart';
import 'package:url_shortener/core/base/model/base_model.dart';
import 'package:url_shortener/view/home/model/short_link_model.dart';

part 'short_link_response.g.dart';

@JsonSerializable()
class ShortLinkResponse extends BaseModel<ShortLinkResponse> {
  final bool? ok;
  final ShortLinkModel? result;

  ShortLinkResponse({this.ok, this.result});

  @override
  ShortLinkResponse fromJson(Map<String, dynamic> json) {
    return _$ShortLinkResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ShortLinkResponseToJson(this);
  }

  factory ShortLinkResponse.fromJson(Map<String, dynamic> json) {
    return _$ShortLinkResponseFromJson(json);
  }
}
