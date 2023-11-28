import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../commons/secret.dart';
import '../../utils/string_util.dart';
bool isChecking = false;

class SignatureInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    int clientTime = DateTime.now().millisecondsSinceEpoch;
    String nonce = StringUtil.generateRandomString(16);
    Locale? locale = Get.locale ?? const Locale("zh", "CN");
    String userLanguage = locale.toString();

    options.headers["Client-Time"] = clientTime;
    options.headers["Nonce"] = nonce;
    options.headers["User-Language"] = userLanguage;

    String method = options.method;
    String path = options.path;

    Map<String, dynamic>? headers = options.headers;
    Map<String, dynamic>? params = options.queryParameters;
    dynamic data = options.data;

    Map<String, dynamic> map = {};
    map["method"] = method;
    map["uri"] = path;
    if (headers.isNotEmpty) {
      headers.forEach((key, value) {
        String lowerKey = key.toLowerCase();
        if (![
          "client-id",
          "client-platform",
          "client-version-code",
          "client-version-name",
          "client-time",
          "nonce",
        ].contains(lowerKey)) {
          return;
        }

        map.addIf(value != null, lowerKey, value);
      });
    }
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        map.addIf(value != null, key, value);
      });
    }
    if (data != null && data is! dio.FormData) {
      map["data"] = jsonEncode(data);
    }

    List<String> keys = map.keys.toList();
    keys.sort((String a, String b) {
      return a.compareTo(b);
    });

    String toSign = "";
    for (String key in keys) {
      dynamic value = map[key];
      if (value == null) {
        continue;
      }

      toSign += percentEncode(key);
      toSign += "=";
      toSign += percentEncode(value.toString());
      toSign += "&";
    }

    if (toSign.isNotEmpty) {
      toSign = toSign.substring(0, toSign.length - 1);
    }

    var signatureToken = Secret.signatureToken;
    var key = utf8.encode(signatureToken);
    var bytes = utf8.encode(toSign);

    var hmacSha1 = Hmac(sha1, key);
    Digest sha1Result = hmacSha1.convert(bytes);

    String signature = base64Encode(sha1Result.bytes);
    options.headers["signature"] = signature;

    return handler.next(options); //continue
  }

  String percentEncode(String url) {
    String encode = Uri.encodeComponent(url)
        .replaceAll("+", "%20")
        .replaceAll("*", "%2A")
        .replaceAll("(", "%28")
        .replaceAll(")", "%29")
        .replaceAll("%7E", "~");
    return encode;
  }
}
