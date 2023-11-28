import 'package:bank/src/utils/data_persistence.dart';
import 'package:bank/src/utils/string_util.dart';
import 'package:bank/src/utils/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';

import '../../routes/app_navigator.dart';

class SplashLogic extends GetxController {
  @override
  void onReady() {
    SystemChrome.setSystemUIOverlayStyle(ThemeUtils.systemUiOverlayStyle());
    init();
    super.onReady();
  }

  init() async {
    try {
      var timezone = await FlutterTimezone.getLocalTimezone();
      DataPersistence.putTimezone(timezone);
      String? oClientId = DataPersistence.getClientId();
      if (oClientId == null || oClientId.isEmpty) {
        String clientId = StringUtil.generateRandomString(32);
        DataPersistence.putClientId(clientId);
      }
    } finally {
      AppNavigator.startMain();
    }
  }
}
