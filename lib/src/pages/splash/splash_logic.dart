import 'package:bank/src/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../routes/app_navigator.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    SystemChrome.setSystemUIOverlayStyle(ThemeUtils.systemUiOverlayStyle());

    super.onReady();
    AppNavigator.startMain();
  }
}
