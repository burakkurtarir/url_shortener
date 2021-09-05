import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowVertical => height * 0.01;
  double get normalVertical => height * 0.02;
  double get mediumVertical => height * 0.04;
  double get highVertical => height * 0.1;

  double get lowHorizontal => width * 0.01;
  double get normalHorizontal => width * 0.02;
  double get mediumHorizontal => width * 0.04;
  double get highHorizontal => width * 0.1;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowVertical);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalVertical);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumVertical);
  EdgeInsets get paddingHigh => EdgeInsets.all(highVertical);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => Duration(milliseconds: 500);
  Duration get normalDuration => Duration(seconds: 1);
  Duration get mediumDuration => Duration(seconds: 2);
}
