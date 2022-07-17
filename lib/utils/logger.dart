import 'package:flutter/foundation.dart';

class Logger implements Exception {
  String message;
  Logger(this.message);

  static data(dynamic data, [String? className]) {
    if (kDebugMode) {
      print(">>>>>Debug $className failed");
    }
  }
}
