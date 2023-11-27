import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui';

import '../../commons/env.dart';
import '../../utils/data_persistence.dart';
import '../../utils/theme.dart';
import '../../widgets/language_view.dart';
import '../../widgets/night_mode_view.dart';

class SettingLogic extends GetxController {
  void onNightModeEdit() async {
    int? result = await Get.dialog<int?>(const NightModeAlert());
    if (result != null) {
      DataPersistence.putNightMode(result);

      ThemeMode themeMode = ThemeMode.system;
      if (result == 1) {
        themeMode = ThemeMode.light;
      } else if (result == 2) {
        themeMode = ThemeMode.dark;
      }

      Get.changeThemeMode(themeMode);
      Future.delayed(const Duration(milliseconds: 250), () {
        Get.forceAppUpdate();
        SystemChrome.setSystemUIOverlayStyle(ThemeUtils.systemUiOverlayStyle());
      });
    }
  }

  void onLanguageEdit() async {
    int? result = await Get.dialog<int?>(const LanguageAlert());
    Locale? locale;
    if (result == 0) {
      locale = window.locale;
    } else {
      locale = Env.languageMap[result];
    }
    if (locale != null) {
      DataPersistence.putLanguage(result!);
      Get.updateLocale(locale);
    }
  }
}
