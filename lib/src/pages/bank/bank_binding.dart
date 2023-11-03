import 'package:get/get.dart';

import 'bank_logic.dart';

class BankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BankLogic());
  }
}
