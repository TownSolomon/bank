import 'dart:ui';

import 'package:get/get.dart';

import 'languages/en_us.dart';
import 'languages/zh_cn.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('zh', 'CN');
  static const locales = <int, Locale>{
    1: Locale('en', 'US'),
    2: Locale('zh', 'CN'),
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'zh_CN': zhCN,
      };
}
