
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemeUtils {
  static Color appBarColor() =>
      Get.isDarkMode ? const Color(0xff424242) : const Color(0xFFFFFFFF);

  static TextStyle appBarTitleTextStyle() => Get.isDarkMode
      ? TextStyle(
          fontSize: 18.r,
          color: const Color(0xFFFFFFFF),
        )
      : TextStyle(
          fontSize: 18.r,
          color: const Color(0xFF000000),
        );


}
