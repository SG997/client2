import 'package:flutter/foundation.dart';

class Logger {
  static log(dynamic value) {
    if (kDebugMode) {
      print("🐢 [LOG]------------------------------------------------------");
      print("");
      print(value);
      print("");
      print("--------------------------------------------------------------");
    }
  }

  static error(dynamic value) {
    if (kDebugMode) {
      print("🐞 [ERROR]------------------------------------------------------");
      print("");
      print(value);
      print("");
      print("--------------------------------------------------------------");
    }
  }
}
