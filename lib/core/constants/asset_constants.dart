import '../extensions/string_extension.dart';

class AssetConstants {
  static AssetConstants? _instance;
  static AssetConstants get instance => _instance ??= AssetConstants._init();

  AssetConstants._init();

  String get delete => 'delete'.svg;
  String get illustration => 'illustration'.svg;
  String get logo => 'logo'.svg;
  String get shape => 'shape'.svg;
}
