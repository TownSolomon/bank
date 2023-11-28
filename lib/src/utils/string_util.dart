import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

class StringUtil {

  static String generateRandomString(int length) {
    final random = Random();
    const availableChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final randomString = List.generate(length, (index) => availableChars[random.nextInt(availableChars.length)]).join();
    return randomString;
  }

  // md5 加密
  static String generateMD5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return digest.toString();
  }
}
