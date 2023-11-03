import 'package:get/get.dart';

import 'app_pages.dart';

class AppNavigator {
  /// Home页面
  static void startMain() {
    Get.offAllNamed(AppRoutes.home);
  }
}
