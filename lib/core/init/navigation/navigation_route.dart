import 'package:flutter/material.dart';
import 'package:url_shortener/view/home/view/home_view.dart';
import 'package:url_shortener/view/link_history/view/link_history_view.dart';
import 'package:url_shortener/view/splash/view/splash_view.dart';
import '../../components/card/navigation_not_found_widget.dart';
import '../../constants/navigation_constants.dart';
import 'route_animations/slide_up_route.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());
      case NavigationConstants.LINK_HISTORY_VIEW:
        return normalNavigate(LinkHistoryView());
      case NavigationConstants.SPLASH_VIEW:
        return normalNavigate(SplashView());
      default:
        return normalNavigate(NavigationNotFoundWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  SlideUpRoute slideUpNavigate(Widget widget) {
    return SlideUpRoute(view: widget);
  }
}
