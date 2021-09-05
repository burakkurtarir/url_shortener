import 'package:flutter/material.dart';

import '../../init/navigation/INavigationService.dart';
import '../../init/navigation/navigation_service.dart';
import '../../init/network/ICoreDio.dart';
import '../../init/network/network_manager.dart';

abstract class BaseViewModel {
  BuildContext? context;
  INavigationService navigation = NavigationService.instance;
  ICoreDio? coreDio = NetworkManager.instance!.coreDio;

  void setContext(BuildContext context);
  void init();
}
