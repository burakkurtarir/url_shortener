import 'package:flutter/material.dart';

import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Future<void> pushNamed(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> pushNamedAndClear(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      path,
      (route) => false,
      arguments: data,
    );
  }

  @override
  Future<void> pop() async {
    navigatorKey.currentState!.pop();
  }
}
