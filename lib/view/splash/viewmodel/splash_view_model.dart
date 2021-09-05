import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_shortener/core/base/viewmodel/base_view_model.dart';
import 'package:url_shortener/core/constants/navigation_constants.dart';
import 'package:url_shortener/core/init/database/database_manager.dart';
import 'package:url_shortener/product/providers/short_link_provider.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  late ShortLinkProvider shortLinkProvider;

  @override
  void init() {
    shortLinkProvider = Provider.of<ShortLinkProvider>(context!, listen: false);

    navigateToHome();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> navigateToHome() async {
    try {
      final response = await DatabaseManager.instance.getLinks();
      shortLinkProvider.setShortLinkHistory(response);
    } catch (e) {
      print(e);
    }
    navigation.pushNamedAndClear(NavigationConstants.HOME_VIEW);
  }
}
