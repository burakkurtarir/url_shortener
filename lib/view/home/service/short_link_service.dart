import 'dart:io';

import 'package:url_shortener/core/base/model/IResponseModel.dart';
import 'package:url_shortener/core/base/model/base_error_model.dart';
import 'package:url_shortener/core/constants/http_types.dart';
import 'package:url_shortener/core/init/network/ICoreDio.dart';
import 'package:url_shortener/view/home/model/short_link_response.dart';
import 'package:url_shortener/view/home/service/IShortLinkService.dart';

class ShortLinkService implements IShortLinkService {
  @override
  ICoreDio? coreDio;

  ShortLinkService(this.coreDio);

  @override
  Future<IResponseModel<ShortLinkResponse>> getShortLink(String link) async {
    final response = await coreDio!.send(
      'shorten',
      type: HttpTypes.GET,
      queryParameters: {"url": link},
    );
    if (response.statusCode == HttpStatus.created) {
      return ResponseModel(data: ShortLinkResponse.fromJson(response.data));
    } else {
      return ResponseModel(error: BaseErrorModel.fromJson(response.data));
    }
  }
}
