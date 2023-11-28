import 'package:get/get.dart';

import 'app_pages.dart';

class AppNavigator {
  /// Home页面
  static void startMain() {
    Get.offAllNamed(AppRoutes.home);
  }

  /// 联系我们页面
  static void startConnect() {
    Get.toNamed(AppRoutes.connect);
  }
}
