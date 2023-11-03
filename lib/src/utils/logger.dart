import 'dart:developer';
import 'package:flutter/foundation.dart';

class Logger {
  static void print(String text, {bool isError = false}) {
    log('** $text, isError [$isError]');
  }

  static void debug(i) {
    if (kDebugMode && i is String) {
      print(i);
    }
  }
}
