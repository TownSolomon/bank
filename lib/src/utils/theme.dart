import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'data_persistence.dart';

class ThemeUtils {
  static ThemeMode getThemeMode() {
    return getThemeModeByValue(DataPersistence.getNightMode());
  }

  static ThemeMode getThemeModeByValue(int? value) {
    if (value == null) {
      return ThemeMode.system;
    }

    switch (value) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
    }

    return ThemeMode.system;
  }

  static Color backColor() => Get.isDarkMode
      ? const Color.fromARGB(255, 25, 25, 25)
      : const Color.fromARGB(255, 255, 255, 255);

  static Color appBarColor() => Get.isDarkMode
      ? const Color.fromARGB(255, 17, 17, 17)
      : const Color.fromARGB(255, 237, 237, 237);

  static Color themeColor() => const Color.fromARGB(255, 20, 107, 230);

  static TextStyle appBarTitleTextStyle() => Get.isDarkMode
      ? TextStyle(
          fontSize: 15.sp,
          color: const Color(0xFFFFFFFF),
        )
      : TextStyle(
          fontSize: 15.sp,
          color: const Color(0xFF000000),
        );

  static systemUiOverlayStyle() => Get.isDarkMode
      ? const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        )
      : const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        );
}
