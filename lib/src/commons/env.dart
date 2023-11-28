import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class Env {
  /// 当前运行环境
  static const Region region = Region.global;

  static bool isCn = region == Region.cn;
  static bool isGlobal = !isCn;

  /// 当前客户端版本
  static const int versionCode = 10101;
  static const String versionName = "1.1.1";

  /// 当前运行平台 自动获取不用修改
  static CustomPlatform get platform => CustomPlatform.getPlatform();

  static bool get isIos => platform == CustomPlatform.ios;

  static bool get isAndroid => platform == CustomPlatform.android;

  static bool get isWeb => platform == CustomPlatform.web;

  static bool get isNotWeb => !isWeb;

  static bool get isMobileWeb =>
      isWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  static bool get isNotMobileWeb => !isMobileWeb;

  static bool get isWebAndNotMobile =>
      isWeb &&
      defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS;

  /// 当前支持的语言
  static const languageMap = <int, Locale>{
    1: Locale('en', 'US'),
    2: Locale('zh', 'CN'),
  };
}

class Ui {
  static const double width = 375.0;
  static const double height = 812.0;
}

enum Region {
  global(0, "global"),
  cn(1, "cn"),
  ;

  final int value;
  final String label;

  const Region(this.value, this.label);

  static Region getEnum(String label) {
    return Region.values.firstWhere(
      (place) => place.label == label,
      orElse: () => global,
    );
  }
}

enum CustomPlatform {
  android(0, "android", "Android"),
  ios(1, "ios", "iOS"),
  web(2, "web", "Web"),
  windows(3, "windows", "Windows"),
  macos(4, "macos", "MacOS"),
  linux(5, "linux", "Linux"),
  ;

  final int value;
  final String label;
  final String description;

  const CustomPlatform(this.value, this.label, this.description);

  static CustomPlatform getEnum(String label) {
    return CustomPlatform.values.firstWhere(
      (place) => place.label == label,
      orElse: () => android,
    );
  }

  static CustomPlatform getPlatform() {
    if (kIsWeb) {
      return CustomPlatform.web;
    } else if (Platform.isAndroid) {
      return CustomPlatform.android;
    } else if (Platform.isIOS) {
      return CustomPlatform.ios;
    } else if (Platform.isWindows) {
      return CustomPlatform.windows;
    } else if (Platform.isMacOS) {
      return CustomPlatform.macos;
    } else if (Platform.isLinux) {
      return CustomPlatform.linux;
    } else {
      return CustomPlatform.android;
    }
  }
}
