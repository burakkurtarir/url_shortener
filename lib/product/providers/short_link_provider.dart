import 'package:flutter/material.dart';
import 'package:url_shortener/view/home/model/short_link_model.dart';

class ShortLinkProvider extends ChangeNotifier {
  List<ShortLinkModel> shortLinkHistory = [];

  void addShortLink(ShortLinkModel? model) {
    if (model != null) {
      shortLinkHistory.insert(0, model);
      notifyListeners();
    }
  }

  void removeShortLink(int index) {
    shortLinkHistory.removeAt(index);
    notifyListeners();
  }

  void setShortLinkHistory(List<ShortLinkModel> list) {
    shortLinkHistory = list;
    notifyListeners();
  }

  ShortLinkModel getShortLinkByIndex(int index) {
    return shortLinkHistory.elementAt(index);
  }
}
