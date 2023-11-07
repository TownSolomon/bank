import 'package:get/get.dart';

import 'interestrate_logic.dart';

class InterestRateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterestRateLogic());
  }
}
