import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';

import '../commons/env.dart';

mixin Client {
  final Dio httpClient = getClient();

  static final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  Map<String, dynamic> notNullMap(Map<String, dynamic> map) {
    return map..removeWhere((k, v) => v == null);
  }

  static Dio getClient() {
    Dio dio = Dio()
      ..options.baseUrl = CoreEnv.api
      ..options.headers = {
        "Client-Domain": CoreEnv.api,
        // "Client-Id": deviceId,
        "Client-Platform": Env.platform.label,
        "Client-Version-Code": Env.versionCode,
        "Client-version-Name": Env.versionName,
      }
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
      ));
    }

    return dio;
  }
}
