import 'package:url_shortener/core/base/model/IResponseModel.dart';
import 'package:url_shortener/core/init/network/ICoreDio.dart';
import 'package:url_shortener/view/home/model/short_link_response.dart';

abstract class IShortLinkService {
  ICoreDio? coreDio;

  Future<IResponseModel<ShortLinkResponse>> getShortLink(String link);
}
