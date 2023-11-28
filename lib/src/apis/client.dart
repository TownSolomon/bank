import 'dart:ui';

import 'package:bank/src/apis/interceptor/signature_interceptor.dart';
import 'package:bank/src/commons/secret.dart';
import 'package:bank/src/utils/data_persistence.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../commons/env.dart';

mixin Client {
  final Dio httpClient = getClient();

  static final cacheOptions = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.request,
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  Map<String, dynamic> notNullMap(Map<String, dynamic> map) {
    return map..removeWhere((k, v) => v == null);
  }

  static Dio getClient() {
    Dio dio = Dio()
      ..options.baseUrl = Secret.baseUrl
      ..options.headers = {
        "Client-Id": DataPersistence.getClientId() ?? "",
        "Client-Platform": Env.platform.label,
        "Client-Region": Env.region.label,
        "Client-Timezone": DataPersistence.getTimezone() ?? "",
        "Client-Version-Code": Env.versionCode,
        "Client-version-Name": Env.versionName,
      }
      ..interceptors.add(DioCacheInterceptor(options: cacheOptions))
      ..interceptors.add(SignatureInterceptor());

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}
