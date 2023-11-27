import 'dart:ui';

import 'package:get/get.dart';

import '../commons/env.dart';
import '../utils/data_persistence.dart';

class AppController extends GetxController {
  Locale? getLocale() {
    var index = DataPersistence.getLanguage() ?? 0;
    var locale = Env.languageMap[index];
    return locale;
  }
}
