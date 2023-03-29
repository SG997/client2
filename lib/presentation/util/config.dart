import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';

class Config {
  static final Config _singleton = Config._();

  Config._();

  factory Config() {
    return _singleton;
  }

  static bool get isSmallScreen {
    final context = Navigation.context;

    final height = MediaQuery.of(context).size.height;

    return height <= 667;
  }

  static double get bottomSpace {
    return isSmallScreen ? 16 : 32;
  }

  static double get multiplier {
    return isSmallScreen ? 0.8 : 1;
  }
}
