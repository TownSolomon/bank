import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../utils/theme.dart';

class AppTheme {
  static final ThemeData appLightThemeData = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData appDarkThemeData = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: Colors.white30,
    scaffoldBackgroundColor: ThemeUtils.backColor(),
    iconTheme: ThemeData.dark().iconTheme.copyWith(
          color: Colors.white,
        ),
  );
}

class AppLifeCycleDelegate with WidgetsBindingObserver {
  static final AppLifeCycleDelegate _appLifeCycleDelegate =
      AppLifeCycleDelegate._inital();

  AppLifeCycleDelegate._inital() {
    WidgetsBinding.instance.addObserver(this);
  }

  factory AppLifeCycleDelegate() {
    return _appLifeCycleDelegate;
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    Future.delayed(const Duration(milliseconds: 250), () {
      Get.forceAppUpdate();
      SystemChrome.setSystemUIOverlayStyle(ThemeUtils.systemUiOverlayStyle());
    });
  }
}
