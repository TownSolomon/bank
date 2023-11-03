import 'package:get/get.dart';

import '../commons/env.dart';
import '../routes/app_navigator.dart';

class RootUtils {
  static void backOrHome<T>({T? res}) {
    if (Env.isNotWeb) {
      Get.back(result: res);
      return;
    }

    String previousRoute = Get.previousRoute;
    String currentRoute = Get.currentRoute;
    if (previousRoute == "" || previousRoute == currentRoute) {
      AppNavigator.startMain();
    } else {
      Get.back(result: res);
    }
  }
}
