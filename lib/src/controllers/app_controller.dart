import 'dart:ui';

import 'package:bank/src/translations/translation_service.dart';
import 'package:get/get.dart';

class AppController extends GetxController {

  Locale? getLocale() {
    return TranslationService.fallbackLocale;
    // return Get.locale;
  }
}
