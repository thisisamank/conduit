import 'package:flutter/material.dart';

class SizeConfig {
  late MediaQueryData _mediaQueryData;
  static double? _deviceWidth;
  static double? _deviceHeight;
  static Orientation? _orientation;
  static Brightness? _brightness;

  static double? get deviceWidth => _deviceWidth;
  static double? get deviceHeight => _deviceHeight;
  static Orientation? get orientation => _orientation;
  static Brightness? get brightness => _brightness;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _deviceWidth = _mediaQueryData.size.width / 100;
    _deviceHeight = _mediaQueryData.size.height / 100;
    _orientation = _mediaQueryData.orientation;
    _brightness = _mediaQueryData.platformBrightness;
  }
}
